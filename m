Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8519272E69
	for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062408; cv=none; b=LgBgrKwScbP3U5i2X3p7lqoT9Nm8jhV574ccvFzD/gHH4ZbxOUGq8sRXi5CSwRGBDhGIsJOeuhSnRSkRalC1zEoZN2Myn0AUmWJEE7JAKQqN8mj2LRU0iOFOxwDxGE+VzL86oTmKjiebGqZKFmB+SOyDYb1UOFd2a5C+DXlppV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062408; c=relaxed/simple;
	bh=dzrhcjShNCoaTrCzZaUpxU7oveFbVSDpyJ8UTGShwms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKFw6Ot/CztgOqlnL3UPyXigGEqY4ma/ioi5uYl1zGFJ5cnbjMprwtWJ5RWoprgBUMMrQ+NNc8LdE7jjfespuUOegEEb7xDm8E4DsyYhTt1OaJQZFOiXMcLD1Fp9pdQqWw03Xwtf7tsP52V7wxCAqfMarF2YY3DGCgU3RxjdXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhJ5vcFZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhJ5vcFZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a528e301b0so556088f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Jun 2025 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750062403; x=1750667203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=du7JrElzZeEeAv8lyMWhqP+Gh9K+o2Sclibuv0wS5GI=;
        b=bhJ5vcFZvaE2zotWb0HLV/2o19Yvun0fJ+5NxlVzbNDnK5U3d9XvaP804pHPtLXpcc
         lQfaStE0qI2++0jIiM6inMN/CBykWFm05HDJZZv/aFC5nrfIjL7mVXIB1g5OzGP6DhWk
         2gvvXH534eB4pNr1Oczq7iQjfEp0x2nFfbQVll+3v4F5+P200/XANbkgzsTHXd9odP4R
         1SD5TS3dYEkZf7CuTdMCjrCAPRr0vJ4Osf/tHIoj3x0k1F1mg12H1MLBSlKUTi0s7KYM
         1eD0vrKjdWvowBSZiy+Oi7cZFSQTAqMF/4WdBhBs0l0GBS/rvK9lvMNuyxoNIYVvPbPk
         Sgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750062403; x=1750667203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=du7JrElzZeEeAv8lyMWhqP+Gh9K+o2Sclibuv0wS5GI=;
        b=qHT5oPJt5F59g+aZ/B5tWwbMUPjLTKz1CTfkxYgn+94QwSTJiVSO//SH9u/NpKvRnZ
         TYDuhhvc4l26xi5ufCOqE64Wr48vSv+sENADE+XRTpdVGwUNRXppkMKCyiwdSwX26DCq
         9YHgSOpldUKrKGxw6NW+TDV6vvwfVit/Pgz+p43GFmCh3KyoVMOpCwIU/DuHoo3Qxpx2
         WSOqY27a9Q3fo0jhZANrRM5pyOnPJNSnv6sUyAaO4mwQ3UDnpJ6MjIXv8yPXQkO99OBg
         bFCn0aMX46JBkFVgjiHkztJisb15OglqIWK0q1BedetczxigQKgLpubHLJwIIEEoTPaW
         nFuw==
X-Forwarded-Encrypted: i=1; AJvYcCWhE1deIAm3xAwrRu5CBPCSwNJpr4pRRyBYYSnvudtVS0oysPA40s90aFTcb9mHy7WDOVYsis3aXfAbbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd52Mp4F/dRfMLSUMGYpt6nQTIuI+KO0I4A+CDaI62WF14MxCx
	VLYZBLzl3idqRiweBjW6co+88EdneLuQZiAThBV4lGcyWI+g8OPwIZEEgXsZlyAqX3k=
X-Gm-Gg: ASbGncu2AUoQggZZQvg+X/PVyzXyKuVtSnYbJ+AxMVKIWzYV6jCG0FbBlhP3ju4hPlj
	Ce7OulbMrIhGTmIs/0oObHTiLf9ZJ/dg9Qc9nTGJb+OyOsY1EqcKhJJrDBxHcn1ZIU4yWqoRYT2
	nIa2/H+xrYCs+o2wYKFq1Ryxq+Avl8TPAiQCGfwYsxlq9iNPtS397IDzN/EMTVCiIDVgy1htL9I
	8+s48zKk28NStuvzwOGOCapjVP4uYZ/vL1zSjYnblhTeGR5tSYR9ihOJOVrZmygvoAvjCisC9Yp
	+TY03h5TrGzU5j3jCAxvjr+8mOa/+A5FnlXbtuoE8yiEDsvADqVDT8x5tFxmzSW3AgRmYiCWNbk
	Q74nVIMg=
X-Google-Smtp-Source: AGHT+IH8jt5igk2cxjvoNOWoEJSi/mpNQI0tFXmRto6kaJk/mrAc9NXRo2NCwvHYWUf6psPiqp/Hmw==
X-Received: by 2002:a05:6000:220f:b0:3a4:e0e1:8dc8 with SMTP id ffacd0b85a97d-3a5723a1ea1mr2457195f8f.9.1750062403199;
        Mon, 16 Jun 2025 01:26:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e980sm10157398f8f.41.2025.06.16.01.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:26:42 -0700 (PDT)
Message-ID: <3e71adab-c108-4872-86a3-8dc6280429a9@linaro.org>
Date: Mon, 16 Jun 2025 10:26:40 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5
 Plus
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
 <20250615-bqx5plus-v2-2-72b45c84237d@apitzsch.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250615-bqx5plus-v2-2-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/06/2025 22:35, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> BQ Aquaris X5 Plus (Longcheer L9360) is a smartphone based on MSM8976
> SoC.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
