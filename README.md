# Swift SDK Comparison

This repository demonstrates how different SDK generator tools produce Swift SDKs when given the **same OpenAPI specification**.  
The goal is to provide Swift developers with an easy, side-by-side comparison of SDK output quality, style, and ergonomics.

## Generators Compared

We generate Swift SDKs using the following tools:

- **Apple’s Swift OpenAPI Generator**  
- **Fern’s Swift OpenAPI Generator**  

## API Specification

All SDKs in this repository are generated from the **Travel Train API** specification, provided by our friends at [Bump.sh](https://bump.sh).  
Using a single consistent spec ensures the comparisons highlight generator differences rather than spec design.

## Purpose

- Highlight differences in **code style**, **dependencies**, and **developer experience**.  
- Provide an apples-to-apples comparison by using the same API specification as input.  
- Help Swift developers and API platform teams evaluate which SDK generator best fits their needs.

## Contents

Each directory contains a generated Swift SDK from one of the tools above.  
Typical comparison points include:

- **Code organization** (file structure, module layout)  
- **Type naming conventions**  
- **Error handling approaches**  
- **Dependency footprint**  
- **Concurrency support** (async/await, structured concurrency)  

## How to Use

1. Browse the directories for each SDK generator.  
2. Review the generated code and note differences in:  
   - Readability and maintainability  
   - Use of Swift language features  
   - Package manager setup (e.g., Swift Package Manager compatibility)  

## Contributing

If you’d like to add another SDK generator for comparison:

1. Generate a Swift SDK using the same OpenAPI specification.  
2. Create a new directory named after the generator.  
3. Include a short `README.md` inside describing the tool and version used.  
4. Open a pull request.  

---

This repository is affiliated with Fern and not Apple or openapi-generator.
It is intended as a neutral comparison resource for Swift developers.
