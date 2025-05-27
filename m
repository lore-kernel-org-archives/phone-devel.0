Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70126A0C6
	for <phone-devel@vger.kernel.org>; Tue, 27 May 2025 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748347312; cv=none; b=ZFkHhoOyWkSf6/yeLWJ+wCYh2K4hkXWYeDBBPiEk2b88uVMFJx8KeOB7M59biJOWWQYp+BqEc1ybMmDmVL65LhbX1zK+lVEBvpLF7OuDJf/FxLsnjFyzGoZ/thvrttmd7bZsivCq/15nCjYTp1dnOpAtyWt7Yp8gTmo6sC6/14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748347312; c=relaxed/simple;
	bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oS67IZ9zrJd+NAVBfu+qy4ye7CQgXbdIQdlNlL2rOsu8skGnMhv4HJCIOuDZX4qKiQKby9UnxtLZ7ugzGh1welbcIzVWoasETVzkVhmlkAgu0T56I/ffmbeeFvS5sNKXmTzVx3U+xHpVoi+SKAXhwKBLTM2XTH+BPnE5p3qwyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un+xyXFD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un+xyXFD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a367ec7840so2386981f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 27 May 2025 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347309; x=1748952109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=Un+xyXFDaiawZehn1l936YdhODefb0bEKjOKQgo6l02ERO5BMS6RwWHTnSrJYl1fF1
         AY9OJRUimOg0G6WA/Fl81ImZSo+kDXmWGQSqJ78gdW+cSjO/IZWtdfOUToxCa1giZjsJ
         I1Rmdw/yuZcM87GR6hZZZE/8JE1WwiQ9tcgMqoVxxaJvWBiB050MWwNFpod/zzWyowEZ
         z0FyoIxeXSsPB2cU8R7Pc/j+Gywt5XJVNZ8KAM5J9J6VVOc++s3ULjeysjy2dm3rZ5Up
         2DB7nAyXw/kw2eJVoORq8LSkE81lkCa0ZZh1Z+Cx4tAuujjCUIhmcl5Z0XPGL9GHDX/N
         /D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347309; x=1748952109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xt7D4sh1I18/wL05zXuJeAMPACAqCq4rpqA/Le9JqNQ=;
        b=eURNoXsLp1RA5uDnd/CrjinEMm1gd21kKWVDzoKI2y1Hv98kRmL2FjxNSpEFniTeiA
         kPg9Z5aZePtQwPXKB1UJKZhE06T0GVgGX+9wfx8piigmPhZA0VF9QMlbbG8ncbKSsnDx
         TWV6sqcz+y0DG4LQjDDSXpbwZUK8/xTVblB8YdNtH1d4SZUd938ANZ0fdQafDPC6dGTs
         dIeXB5dK2wZk3rJyNVs5lzgQ2F7ik9W4GtInRj0w3aOPjv7VbXgnAp6VUrD8LajQKg7D
         lEbR/iycGpLZd0xq9AO8XxzosFhT5p5PRoVmKFOJ0cznl7SeqMmtXSG7q8BHhy/RR+W9
         KrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBJUFph5R/tEPol3foz8Aln1+EJVNrSN5uUUtDKBVAf+A7K9ijAyLD5vkvQ3ZFjOh+z/DKR6XpV04eUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdz8nQ2eYrKKZvna++sy7bP5g4qj72ogE8B++Y2QDUxIykQ1e/
	JgUZHWove2D40Hr5SyD3TEF6K5XM/vxn6BVjN6/mE+4t5mCoUByQbwn4ruoUb+3tUgs=
X-Gm-Gg: ASbGncut8b8sSrxB2W4ouy2RAzSQKH4MNe/QW6cjGhkCf01BcNyAl8ZQA3Ua2KJB6FV
	gXyuSlAtZ8b+esWwSXlFcN+7wCfIkTxV4Vz1DHBLpaPC1pwwHGSX8mmGLZJIoPLVn0L80/+FcC3
	jo1SV1HuRSUjHbZZ++3dndK9ypAmy9jH+b+HyM4LnAqbDn2YJFHUB/D3G4+uF5E0ji7ZKCuxuAp
	mXrXyZAwrIPDvA6/P/NAgVSmmY5hlSoKwor2WuShd9LIwpzYPdPSIARWvyYRVEek32ODWZQI5pF
	kfe/i4DxlyoMbqRstLMnciLQM2AWRLxJbYqI1TutkB4Ve+VVf1BxQIBt2pq8+XqRkIfwIOOuKg2
	K4CqLaFdsJB0WxdeLSvfpcoelQY4=
X-Google-Smtp-Source: AGHT+IFWtDLH1zwZOq+Rw9/Jw8vNdc0tJOd1ARYqcoxhkpz9AqYUyEe5yiEWhYdxUf/zfsOc82GHeQ==
X-Received: by 2002:a5d:5f8a:0:b0:3a4:d9fa:f1ea with SMTP id ffacd0b85a97d-3a4d9faf3c3mr6111892f8f.7.1748347309236;
        Tue, 27 May 2025 05:01:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d437f961sm7631925f8f.17.2025.05.27.05.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:01:48 -0700 (PDT)
Message-ID: <308a2447-5fd5-41f6-bef2-b96d3aef4de8@linaro.org>
Date: Tue, 27 May 2025 13:01:47 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
 <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
 <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2025 17:23, Vincent Knecht wrote:
> Do you mean to just rename to vfe_vbif_write_reg()

Yep, its more natural language.

---
bod
