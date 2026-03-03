Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE53845A8
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531953; cv=none; b=TY091jlepy8iYH98idbHR3sI2eSlGgvVn4lOAQEGDaZJysGQqazh/8FkEDaHvx9AiBYTK5GS64sSfm/00zd/BPXOlWyrY58kfO2tVZkVmTDgZ7YYyovCGseuucr48ZrQm4R2JHkRB4v2jOOZI33Zg/D7cUBXHAMRvhVU/qa/n4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531953; c=relaxed/simple;
	bh=QGMm0930+mSMs48F38ZiFubmrytzhmnP8xNjA1p9+P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkxeTTD0NpTttADYLhAh7M0EVTBcu43kU032SsAD5iGur/IIWTxPvNyBdPxXOMfYU4/eeS5P5HaJi6SVbQeWxgPHdGSeOAEypfzzqHv1alR2UsBu0PrEaXkeOXxl5/zd89RTy7nCvmphPE7zGDVLIFWfZ+UU1Y9Zi3N6m3jTYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rh34oxDD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rh34oxDD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so45375345e9.2
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531950; x=1773136750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=rh34oxDDO3Yo/C4e1eTJh9bHQhti2Kon10q8yfvq9QujYV6JDs68elBzrZWUBfPtYG
         AnUTOtelVroue0gs41PaQ2D0gESVpfiDaaSJXYK4GNxF9oVf6E3cJ+SJHuPs/C6EBt25
         UkBZhW+NFjektlgzcUQvkfoaKzNGqSdQFWBl8NgwEZ3FYU/+IYW/WoF3SSfGO8jP1gMJ
         DCvEr4yQjpwfGM7JPfcL8qVUo35SOLnJ16usSR14UfNNAe4aAjqnfkCaioLLkl0FxvoG
         DZCgnfFKWmvVYcuVgBTFl5I+gG0q1v+Tc0AS3hxW3bZwTDMr/WyF8ip9IOQrBJm0xxgn
         Prig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531950; x=1773136750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDpYmlYWuGO7Zj9mNcL9eqWVIj/B7W8gyxJf835jpK4=;
        b=OG4wlCmgy0H3/CObIj6UGg9lb5Id8POOHfn9YqtgKj9OUojIYoukqTQ9oVWBN7nQLs
         czK7SArt6xx/AQkSAhiGciTdUttGXYAfw9kD4HL87pVpvEwpLpOcXO5Z83bLyEHcidpd
         3ntBr4kkwcy03FRgFGZvOnWw+rtEogP7YAjok3cg8FkDzcmZu1VFhZfdUHq8XRcINYbE
         0w3x85mbZjj811Fofc4KLY6wNQdFPTjNUi2VPyxKtDmNrnK3a/v4bd0nGr0ejV/rta67
         N1ORj9GJP0wfio4Sn1VFmHZqh+VjN68djmkx+Y6PSUr1DqThxpkHBFUbgQ3Yl4rHw0wd
         0+tw==
X-Forwarded-Encrypted: i=1; AJvYcCXNgcqC0PEYKsaB8JhdoML15GCFDDXqY4IvCZYGMiT3tmx0bf8m031jleWBX0mXZXhQhfCAslg1VfkBaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItxTKhiv2C9ctPX/4S7le52cnF0h5zLS/6EZQSuNNdi4Yyhl5
	LI7Sb624iBtyn1HOLh1ftuhVo7f3xddL1Sdvjlkmv0vkPUdhq9x2CQM1Fszy57hNfwc=
X-Gm-Gg: ATEYQzyAM4171hR+nY+JfrVbwEN+AN37/GWWtZrwjTVzk2UpIiFf2usuynO2Y0MPZyL
	OCq9smw51tfa3pZickoP6dlUEevTWJQxlp4Ntb0MNzkY8fLsdGVaZvfNeGguCJeU+L/CgndtG3A
	cpkiomyOELeF9BcLZqrZLF/IAKi8rMTz2Gq0L1RL40fPFbojE232lcGKJqdGwE9YVNhHveAcqqN
	bWP3bsm/i9oFyNbeS9NlgozxdlhelWDcwi/AHKfO7luLSNjE8V9e58a9VxkZrqI/mZmy1OOY0Oz
	LibAV9DQ1zmf4/xs8XOSTHjF5uOTJMt8prpjwfk4LNwXwIMgDWx95o+ORVCccG+7Wc5AIM/w5vh
	BEM3f9NmPnh+bCQZJx6mhXyd3UthRZuUvlgADAFEjqnJa34ExKjug636Rh/tofLVo4jPANppmU1
	KoPUu6STDw8h+3x/8CTAe/DYzsrBWvSFCBgbgm4MbklntTdbB4cB9Wb3ia8usZxZz3
X-Received: by 2002:a05:600c:190c:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-483c9ba7b9fmr240418195e9.8.1772531950449;
        Tue, 03 Mar 2026 01:59:10 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b44207sm351733085e9.7.2026.03.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:59:09 -0800 (PST)
Message-ID: <10c3e5f1-b078-4b48-bfc6-32199270b86b@linaro.org>
Date: Tue, 3 Mar 2026 09:59:08 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 8/9] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-8-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> @bod
> Proliferating special cases in switch statements on a per-SoC basis is
> verboten.

Hmm, your ideas are intriguing to me, and I wish to subscribe to your 
newsletter.

---
bod
