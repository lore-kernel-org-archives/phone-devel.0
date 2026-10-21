Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594858;
	b=YT50SY9v1BnTbH4cXcrkGrJS/cwfOynbuc7KPVPe1ZZkce9xBhXbRSVSh7a19YM+f7Ua
	 tl2Cs5AMORzGnEOTai4hGI40FfXDd4qDLeexoTWjjUsK3L3UhVFU/PLTnRO4i+kDTL7Ij
	 DSprU++6WzSqF8uUU2HVBrhTk2KlVk/uad9WCa6f6QV/MqPOserZlxUEwbkLxftzcmtcK
	 YEgBfUOHu8ns+B2BA3kUprs9thxDPDOZ2fT7RlxhTNJDkHNy1wm8G0Uux6J/lJ9P/n82h
	 PaNPcecYlSMXCTzUOCAlwya6IvqIO7qr1BjTOGX3nVUQMLPz5+V8K005MTmcQISsv6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
	b=sKvnjJkb2ylxbXmLhplfwf0ziSGLtO0WvYweK2ldWKbhlvyfmsNZ+cenbF61KZCLLws6
	 NafR9AOrOddx0rndnx7H4fO4/PJ4HMiKNrgW8ZJiEM6OaPt6p+LNtFD99MfmrEvOWkbo1
	 CsG1sKJr+DuTsmt+VqBin7gCQWX7xE+COZ1VE8SmX652mONiX+cPHC1klaAbxgYThPLxv
	 8H4r3ijpusK7drGKG3fAKfDI+1clEDP6lz82GjswgE/lJkD8xE2Cs3ijWUe1hKcZDy/Sx
	 pnTjpEVVeOoaI8vJKIkLC5CQ9h7EfwMuOKdGdd4vhYAT1cWZBNh1jn0+WrxnCxTf/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703B606A31F
	for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B703B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso758182e87.1
        for <phone-devel@vger.kernel.org>; Wed, 21 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594851; x=1793199651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=A4xznEjyd9gjdzKJkX+mfkvPlnSAO+4xALnxI/8O+5f1RkwqiNl9G9bfCPcbIutDVY
         GVCQ6FNmtaV0q8s8YugGHDOeZRepbnQP7RqEqiqadKtcNsI9ax22vJGapQV9Lya740fX
         WpW+bitVEHaEIv6cCUxh5CRoe5V67OQ1ib4iDx0evFxiGLA8ifUnhFnOSsNECBJsOUOx
         7UCYNCH8OA24vPDw+EEq4bMJMiuWSAeDrkFaeVzQJH9s188awoox0hcdInX75Aaf5WEK
         O1lBSq2ov2DhdZVHI4M0oputoc8BXV4E6DsTtkiHjsWBEczfjA/T3rbIkHrVTTjE1Qil
         6IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594851; x=1793199651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=v8dZQSMrptPSthiVNbw093yZnlwmv2h/RkK9qEzf8nvjrvyQvd6KEOHBmRcUzxsPTN
         dLcUNK77muMNWPjLfOKf8fkqUifAqne56sWUVHPYXCPGashBcxTRZ/iH4y/yRy8OqPwt
         hxjBUpiYZUVIU3CRBLHjjz7wHK7Y22NnQHgX3y49ci+bh92mE5Tdy/TYRuwVrgmGcynz
         tmxYrucTWeUfDanNjCl0382rtZ0jc0IGASBjHHiORvF8/mqEnu1EDQ2dINyIvBSSvwES
         jQbFvFJPX5xW4Exm5X8vsQoOeLIVK8VhV/E5vUo1fGChn6NygwRunSLG/shQmyqmZKzK
         V0Tg==
X-Forwarded-Encrypted: i=1; AKwUvByVLI85+F7A1ksflDE8ox5/eKNuXFSWTBCKZBLryg0FhvJKXKKrEVOfmGtY93Or+cojW8BlTescHEy/dg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKke1IMcb9l3Gv3zuSfwG1rvdfH9izwkOR6NJBcuD6ULTh1v1BS
	XTK4kGIy/3L7XIQTlxm/OZzVQ7Q6wCMhPy4Zmlyyf/Sdn2L3YlrNq1vE
X-Gm-Gg: AYBFou3bOyTX/ykn0fnb3uF+t4IxqDjM0mH6xQ8+vQSuAqKClSb9SeJ1jIS447QuYez
	7py71ztSTivSCWL/yskA/q60wBE4URCdBKg1W0mTXxhSjia3+opmd9RltrUburX3iaPcTCazUCL
	ngSmMjAKBBRiTjpk8MRb5b4C72KfGLUSblyQk903nAWP2BzI86UjTCiNzO3VCkQltV5OTr3xp2w
	ucEo96AUL76CB/fpVa2GjMXrL+8gVld2vfvvwRHLOHqJPgHgyIjVHP/UbvGr46d37AXxjthDf2R
	Pg1a9yGLNrmNgWwPy/q7pcOp1dmZ8rwhD7uEjWnLhNZA1hn+50KV6diRLDACAgG7PMk/ZoZjpYW
	yPNIgDsxXJdBP47RH38Xj8Xi/ExWQDUcoud/ErcJiu/FoJzOMROsn2k8u/6y9Vq3Y4r585JCZfK
	lI7/9ACdQQMVCyPEaHaZncspMnQ9XQEHQr24rmT0nypJ2FZUWoxANlAONZDUVsi5VcBHf1EFkgL
	gGu9NqHnceQb0zQ/J5LFEF7eJUCTgf5LsgEqt9FUOEOoLD/vp05U8W8NA==
X-Received: by 2002:a05:6512:158f:b0:5be:5184:a3c6 with SMTP id 2adb3069b0e04-5bfa1bf3e17mr812374e87.10.1792594850692;
        Wed, 21 Oct 2026 08:00:50 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm168605e87.7.2026.10.21.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:00:49 -0700 (PDT)
Message-ID: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Date: Wed, 21 Oct 2026 18:00:45 +0300
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Have you tried using the bus through the normal QUP driver path?
>>>
>> No, I haven't. GPI DMA support for this platform is not yet upstream.
> 
> It's a copy-paste job, try it out please.
> 

The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
it printed limited information:
https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {
>>>> +	qcom,select-utmi-as-pipe-clk;
>>>
>>> Is there no superspeed / DP altmode?
>>>
>> I could not find anything that confirms super-speed or DP altmode on
>> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
>> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> 
> On the stock firmware, if you plug in a display via the type-c port
> (perhaps via a dock), does it show video output?
> 

I don't have a dock or a DP-compatible monitor at my disposal.
I found the schematic for these devices and found no wires for DP
altmode.> Konrad

