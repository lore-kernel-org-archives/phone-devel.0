Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC89A26461F
	for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358858; cv=none; b=APWrENv339iPTIlZqoEvDNG1+yZsl989h00g51siVpqmRGZWGmQY+awz0DftRzCGiCZGjiADUOf6CsUzjBzFxOFdFtg+lMEZy6QQ+QVrvv6ZCCPtzThzvrR2V2HZmq7gUJxjBb9VkMMe1x/dHh1BZ+9FAfg+rjrfqr7UDJ03N/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358858; c=relaxed/simple;
	bh=1CZuCyQ4F7gIhJWlCZS7gOU94W9dFudind/rqbdZLnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6+wDkubF74E1JW6pMp+l7GSHzke1Pangb8XJxajQ/mlQhR6TXwy1ACy2oIP5oY/Joino8nzmSpcEKhblHuTZT6WHnFrguBi+E81XvUBGYgAsdoCDffY9poie7D8GXArHLmTevwJHU0vwNkVEfhFqVwaGs8DxpPyQviMDlTD/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbhw+e6Y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbhw+e6Y"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a3cc771c26so6646337e87.3
        for <phone-devel@vger.kernel.org>; Thu, 16 Apr 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358855; x=1776963655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=mbhw+e6YOzTXs0axvtFDK2+Shs5RZqoVEKCp4AiAgq+9DwRWx/afofi2IMKkEHUZCt
         /v8DyZQ0NndvOt7baJCgUpaykGAuB7kSdhZ1em53Xy3V9QL1HrIjJz4VtQ3NksC87EkX
         +k8GJ/l9vB9wD/9PVjyIxaONFjDDNBWg98iLXqHMRHZjF5FXAARbcwn1fCfj7Jpc5zGo
         oK0REA0bewgZPuWYwIGYuA1msjcWuilTOCxj/F7TRN4jYV5mJwosrU+LnIloky3GzBSu
         ZvbfgfFAfo8BTJ6UQag0K3iJQnhEwEjpiqFrE0WEoTYVztEZLi8tnTgoF2IqZw+bJH2d
         Bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358855; x=1776963655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=QkPMzsPWovcaQcgWcXUbVki2zqMmTar5ic5+f8pTN7962H7rd2wMxARa66pPIbO96H
         i3dyWZeRw85gffCcz2YIwyalz2qCcM0ZyD8D8iWhz/8unOhyO5vVaLn/8IunafpzgTiG
         I9hSf2b8V0aD9GZVxuELzAWxwaGivit36QnXm7uCmLzGzkQEFgwki8xMmxt335wIhbMj
         kyTeJQYuZOp4FOeT0r4Uz+nawYVxPrVdTHlT0kWmR0Y6h828+V21vcVKGKgGfnc0//i9
         M4CqoWbAcyIay0P5DHjuSp9wS1pf/hiitMzhj4WTbyO+1eytjc2aVAJ/d5wFbIefRWCF
         aaYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ovBjYXJ74yrVI4FHoUO49YQBEMMOoij0djcZYqV2VrtQhRsHXz/2R9JNySfU2HkWpHSh4Un5nh4pXiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmw5qJp5yTyDtvEROwE7zxQVJ1oZz/vujQESTyk51hYQiPB3Kg
	VnVfOo428Llo7LATqY4yhoAYbIt5/PzoX7XQTrQpmz05iAv73sivQx/z
X-Gm-Gg: AeBDieuNhYJILhOHVJ9VGRv5clmYW/o5ihlVx7tIzRKbvlflN/xx23BnmbRxZN+M2y7
	JArED3ZFM0wmFDkFeclpryFPcmwIM5hVVI3m9z1WAAccpwla6KDBpZ7unWZIjgWKJ38F6Ihhjxk
	tUfFyok4bxlnO68goEZPvD6FUraXoGOgomg8S2SgwyS0VSMyXFvhhB/VhIa4rKpYOOvujM57mPf
	ligzVb9cfgVeglMsj5y3p08fchQu3nFibOFJjPLqXxyDcBd+u9jBqhLzsyDB62jyVq3L8RH13Bc
	YLjLl36WhiaPEblCvgxtbEPp0xQp89fP0xdYPuQwMiAJzp5n06lny9es2pVq2kgthnSq1VJI859
	McpIG5+08jUFuh2VL4CefaC1XTpnwl0gKEf6YTJsGgmyOTEgLlHtf9h0i2tx3EEyZUSRJ0Xz+1i
	KKFBA8vIcfoLCfbrT8Izi293Dusoq19zWbDIZXuIjWxfFFJj/+5J12xXqBJR3DRj1FrDy5/L76l
	4I=
X-Received: by 2002:a05:6512:3405:b0:5a3:fe5e:3d5f with SMTP id 2adb3069b0e04-5a415540f62mr51697e87.20.1776358854697;
        Thu, 16 Apr 2026 10:00:54 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272e14sm1416433e87.3.2026.04.16.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 10:00:53 -0700 (PDT)
Message-ID: <6b8f767b-98c3-4e31-beb3-20988f764359@gmail.com>
Date: Thu, 16 Apr 2026 20:00:49 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>>    now, it does not work. It can be enabled, however, it will result in
>>    breakage of Venus for faulty MSM8916 firmwares, because the code
>>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>>    this would break support for some MSM8916 devices. What could be the
>>    best way to work around this?
> 
> if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?
> 
> Also, you mentioned HEVC *de*coding, while the commit you pointed to
> disables *en*coding (decoding had been already disabled prior to that
> commit)
> 
> Konrad

From the commit message I assumed HEVC decoding had already been
disabled for the same reasons encoding was - faulty firmware reporting
codecs it doesn't actually support.
