Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4C1292D6
	for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089341; cv=none; b=GDpTOYbUcH2jL3nTqcqyDA8VQaJH2kS8pQ/3W/EyV8V8HDhIYqFDA9Q5NtWbEb6wnoup8iLaNJpP7VophiixVkKfZuRMkkLIjIe5Y+Ldl9mqyOhvRNS5sRu86ASEU6RFDcvKbm9OUiIron3U4fryk5e/WkNwTGtWbnrjmCOG4Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089341; c=relaxed/simple;
	bh=KshJW+Af2TZqa/p/ikCF46YxCA1R2gN0qy3Ynw3oeAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJv50fFrNn2stCNpUj5icNOw8BH/r6+33hkKm0p0WDmxtn8z6zlcahBsDb+BashFFLfaKj8aBFP3bmOVDcC64XvFAZwsX/m0WZRX15yhZwuX3R1HcFkBkvAIqWI82NlplwVvcXe7FMuXf45Hwq1zNr3Fj96/ef7+kprfIAHeqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLh07+Qv; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLh07+Qv"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso3227016a12.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 05:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708089337; x=1708694137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBSXdOntPeLAic2YSCGmE1hb9lcDpa7YnXt2WuP35RU=;
        b=yLh07+QvXUvfz5HwCuG/XW+4M3bctiuB41dspqytbspm5euFsfIHTMyuQwBcMDC23k
         46DHtM5ScrA+rHGX/pSJQi61RLYVlWth5DOfZwwAvdbCc5jT1Ed1c9rkmGsIRTmXiGmV
         2OLUc0xUXsuqcNDpGdxu2XY3czfssi2AHjGO/GdgF8G98XP5/dPCfMT7cMLgyy+WsmoJ
         ceyv7T2M060+tifdge2Ngjv0Liw2ZvWB75s2KOKo9QSm9ipPVva62scgYhkfHoqZIqiS
         wTsufVBP2owe8Nm3AoYWdeErYL5Y/ftBhp8q27MPNCnKhxxeQ99bfRIiCAw/8OmBP2OK
         83Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089337; x=1708694137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBSXdOntPeLAic2YSCGmE1hb9lcDpa7YnXt2WuP35RU=;
        b=SpWcb7agI2QBNSOJpAx3h/r+YRNCw+DmMPGGGNQZOVBalKYWuchQZTmnMOt7RFESMg
         O1Bz0xpeOJziLdAh/ZeOFKOe+7Jh96bQbpnKeoya8pvvHhJnYK0Svpw04tlWpDlhS3DL
         aRABZ5qPFWcitpxS1YHJxnu+CJT1OkP7jhSeE36jOQnwqc504gzjykX3pxum+nkKcT63
         02S+6nC61EIpt5Etjt7goxm3xopgKQtpTJR2W7Ecrh2LDnHMZBAVO5/R+I7/r2qqVRYN
         NMGSvqkUfqJR6GM9l2RYsfBAMbylMnqO9q4NGEw6Bd1H1By4G9qnt0sU5WXbgUs4iIec
         Mswg==
X-Forwarded-Encrypted: i=1; AJvYcCVwjTh3p899eMCTrSIxlVw0Yoo8gRb/Kyt7f8+AQeOexS/sg0vybY7Ct9rMFcOH+Zel/m5ZlABYDHI80v5PjIFNwuqz1T3DHkwnAnE=
X-Gm-Message-State: AOJu0Yz7Pb+q1Qmi5v7VREIYq8babyv8zXzfH8rOdvPqOuS6c/m7rd0l
	0Zx0n9XcTm3GhO1TPvBVDXeuLYGv7lI+fs7BX/oGBwsI8z+Th7sG+ufSegTIyr8=
X-Google-Smtp-Source: AGHT+IHN0T63GBIdlJqFXJYWH/wKCTSEx2gfTLEy2txVqfz2CGcrM5HbyOvRyjHKjO5dSTDnv5EuJw==
X-Received: by 2002:a17:906:a29a:b0:a3b:fd70:f9e6 with SMTP id i26-20020a170906a29a00b00a3bfd70f9e6mr3237189ejz.5.1708089337225;
        Fri, 16 Feb 2024 05:15:37 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a3ce36ce4f9sm1534655ejb.83.2024.02.16.05.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 05:15:36 -0800 (PST)
Message-ID: <ad827531-a470-451d-8f60-0fb82065cee5@linaro.org>
Date: Fri, 16 Feb 2024 14:15:35 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add interconnect for MDSS
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240216-sm6350-interconnect-v1-1-9d55667c06ca@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240216-sm6350-interconnect-v1-1-9d55667c06ca@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2024 14:11, Luca Weiss wrote:
> Add the definition for the interconnect used in the display subsystem.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
