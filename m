Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1863414D2BB
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711700; cv=none; b=qTXtJKvqB8RHayR0amIDoCCDOfd9ExVrGxNpkc0aGvSj/mspz+HyQC4V44nfYew6y60L+3A0SXgNGglr8I/2dhnqVEI+gnlxUo57lTC4amwJ6XWRmA58rF+j0jqCtwTQKA6Z8rX9r7fdK31KVkwBt5VbXHdG9yr0Cv0eOfMK31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711700; c=relaxed/simple;
	bh=+RPHdWCuOFGKxKHb3kNZJz5Nok1P5PnRu0jTv0Yjtqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dClagDUM69Ua3IKYJAmPhBQC2eXfmxXhQVfPPpq+PzZJUG+RgLiDls53HIH8dvediXo3sabkApEG2xjTKr/1m8PJN9a5JBIqmMv0dOCQLndrC2m+cvwbwMCMuoQeabM4Wr2MljVDvYs+2TtydqzSDMllzDaAMmf3o8e6j/AB5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQXv8q7l; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQXv8q7l"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c9034860dso6724838e87.2
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718711697; x=1719316497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dT0ZZ+PowY+v9iELFfhytd7yEOVJUW3dNiMcX91s7M0=;
        b=XQXv8q7ladgFdsDmvbOZDbGOMjtTJMCm+jmeX+zd1kI+ZVC9hF2/GdLM/LUSVv5/NU
         W3m7Ng3vRH6PngAhR+cnTDbduaEzCJJiFNPxSd27he7zMbXRJmWon2s9HOHXsyZpEBy0
         Ig8BucK4+nCv2D+vLyEfm0e5FdUbcfGQpkvE09VZ/benigI6IJmJW9n/FZ0gb5E+vcbs
         q8o34Nhwz1P/Ak0FFMFr5JGFWyK+e3UtmSnH8Uvc+BrvsXKefA8UDKdH3wrdruUusK1j
         PMBixvEUf3KDQzGOS4pO4rY3hF9oT3jUBJItP6bwzE0Mmx/dhDJlrL9/xpVJRN/BrG4B
         9i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711697; x=1719316497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dT0ZZ+PowY+v9iELFfhytd7yEOVJUW3dNiMcX91s7M0=;
        b=k7hazx9EyWsyT/hTJT7IjvlHp0DPUydzEJfWwshrcMhhKsfv0mmCqx32OjIW0GO/LO
         N2w/BTW8RhSIe/F6H7XeHY0e8h+Ox9xJnuahhrmWZd6OEa351D3HjOni4Fqd/moQa/01
         mEOUltWKm5zCOWeM1n6/SJ3Kt/TIj/o/qqAut1WU/wDfipiiy2rbcsUfzijjJdBHq9Qz
         pH4kxkVJ9Y/NYUToNbB/1W7KyJzOPARXpN20AuvhyvaUM5y8oz+v+nZdJssiOW7Telcy
         04FM+5RO2/C+g9xbsmSdjyO1Z4gR7ZP842FhFyLlEN+AzK/WeF1uvw7QoyvQGc/4FzV2
         zr9g==
X-Forwarded-Encrypted: i=1; AJvYcCXyc3CoZ0Jxf5keALcj5dIwcIvwFPoAFdNA/MpFGXPkTVI4CDOI3C0L/Tc7Ajwt47tkZn97tF5CDBcrTwvBLdEfOTTSc/zp3DPqc4Y=
X-Gm-Message-State: AOJu0Yx6ftasDvoCSM5jzAj97/I+U2nw4ZH+8bsULq7nvaR7WC8NEjyT
	QudBMf5SUADkOYzQYgoMrpOSW7r2qdBV7VaWOVnpgzfNSNVDykgAlAbw/1jVNHhATr+yQrNqGTI
	D
X-Google-Smtp-Source: AGHT+IFwyKqlRDKeh1hdIaDZfDwv6zE8VqJfCQUflirsO1eqZwtlM3OYLFpWClxeG7+ucwbIfYFaOw==
X-Received: by 2002:a05:6512:3c89:b0:52c:76d:dbb4 with SMTP id 2adb3069b0e04-52ca6e92abbmr11576688e87.49.1718711697428;
        Tue, 18 Jun 2024 04:54:57 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca30928aasm1476984e87.283.2024.06.18.04.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:54:57 -0700 (PDT)
Message-ID: <a8f43e83-c286-4e53-b9e2-988bba9cd85c@linaro.org>
Date: Tue, 18 Jun 2024 13:54:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 framebuffer supplies
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
 <20240617-peregrine-v2-3-c8835d2da7af@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617-peregrine-v2-3-c8835d2da7af@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/17/24 23:22, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add regulators used by the framebuffer of Motorola Moto G 4G (2013).
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
