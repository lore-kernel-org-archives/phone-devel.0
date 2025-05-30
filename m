Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11C227E93
	for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606017; cv=none; b=kLzkXWyQeBrlxGf35EafYvcHp+yYWUCOZjEiq0BbMapYnljnn1iT1CN54HsR8uOh/NwQASh+1dRzhO8kvL0m5yTKA5u5CinJTcQq377SALXqRbqQXru32GSkOEch7CvZQayZDucmPX1rVTOCzBqxX1eg+GlzesjPuE5mkPla6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606017; c=relaxed/simple;
	bh=S3VeWtxKlJvzTgUsBlJdwT0AenvLuNtDX75s3YzO5DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUilAUy/F9EaBotHy1P+67KmoBUYLXNZeZcJUo0gAPU+5h8mL4dO2CqtkHDssaJ+10I4b7ZF7JbKxyzkK17p4T8M+DwNN7QQejJtliVoNxtreT5gukxW4qPGOZGYVPm7milobBOy7qrVesELUBjKmHSPKJFmARB/zif+1zENOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kuJgAGYB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuJgAGYB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so14261675e9.0
        for <phone-devel@vger.kernel.org>; Fri, 30 May 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748606013; x=1749210813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UPJVljTY3N7PN9rlPr1KNAMnaMWaV65uercPLaJI+o=;
        b=kuJgAGYBzJCf6Ip7t/utX+OMl1melh/8OtH6rBCZ8QfFzYHE5lbO+ozlZFdYfxqPON
         4VVf8TjtC90VND4TUeJORRMOWTRJf5bbtecJO7/ov+ahPz0RPwLRYPqBDmFHAd2f227k
         33J5AC2X6UdxnmHqyN7u/D+xvwgKIAd4ARHwjQu5pOMdPX3nGIIVA7f+IL2dyzcuSnWZ
         AjPHEn5RCVB3uAz1WUuRx7Jc1zO/ZAENf9PIi8jLL+KlyN28g6Rm1yznEC4DyrZpYaPV
         qKNrLaGMkDLhVFKe0w5xs2DGvxc/Ud3ez4L0yifW+29KEuWhk9UotL7u+UWBWohbg07I
         8hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748606013; x=1749210813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4UPJVljTY3N7PN9rlPr1KNAMnaMWaV65uercPLaJI+o=;
        b=AY19bLx9eYfRTXxxzVZHIDp3fpRBcxFLUtbGnNrHIP3mnHv9TpersVlLJ2URpEym+f
         Hd/AARAqAbE9sx09tNGMUzPTQjqhKukMJDUKDJh8KcRnDeyX23nZLWdrs0f6vq/4GKYm
         2l+Umxh/jCW49ZmDbEJ79CYAqQmk7csRi43V1SvOiJbSDzfodlc4Yk7/gXTKqGE0zo+S
         6mOERngIIY86LBNShbTmjfqpcv9QTc3O7tpF8dQUJnHGxQ1LARU5Tl2SFoMd8LC9yK46
         lVmug0wFoBXqo7aMSfdLtjL084z/qWw5FviDp5hCkylPgK5qpbgFXqrQB3TDwVWoML6Z
         kT6A==
X-Forwarded-Encrypted: i=1; AJvYcCWFrkuWTePsFohbc1KAzwqIR6jBYpVEAzaKfRz6qaWsZk/JpFp3v0vryy8R3/aK78tFHTE7ePVldua46g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoPJRJ84IbCXDvc5WmHg/wUDx9AiOtGkBSdgWQyeNzw7sqok24
	C6Hyuhu3P2xNj8j1ReC/xJpwEGrTn6ntvuOV9ywhryMdyaAaUGq+NzoGUggV68fadoc=
X-Gm-Gg: ASbGncvJc7dKmx9Y+LgBUOVNEzFytnR18LJPk9oSG6RjolQjgAITwkyHvWNo6+I3WUV
	jC9fMPSBJENvdSHRAWzs14WxIlo/5dNhIzs8VZXVpEzdomR5jX5DsTOk7/+WA3z/KtrkFP5hxyq
	TABktjAWendThJnJq/HEflADqjiOpvU2w2JlEPEJlCIgOs0634lBQ61cPc3Z6tvMxNn46cDze+J
	pzK6gxH29azpnwUbxbtg68yubpqUYK9FEVyrj4csXXBuMwO6DhGubFyu2Ab0Ohppg7ZiWjHmWeF
	aauiZmbNocxCfUHnbmXMgN0vN0MG8lqCyBbyW/Ikwkawh3yupFnSN0PnYxp7L9UKrJo8/P3PfLu
	9/tOh7+UQ9ZjBxZjrSckY7A7MqQE=
X-Google-Smtp-Source: AGHT+IEf5MxDQRZ1AOD7sTcnaYqSwj8ugFOpC72ckU4hsD9LywwTEslaQnTKyHBKOB6AHALVuW7X/A==
X-Received: by 2002:a05:600c:348c:b0:450:d07e:ee14 with SMTP id 5b1f17b1804b1-450d8874cecmr19582285e9.17.1748606013438;
        Fri, 30 May 2025 04:53:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm16096695e9.24.2025.05.30.04.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 04:53:32 -0700 (PDT)
Message-ID: <05ac9918-cc95-4288-a185-48bd4b31b77c@linaro.org>
Date: Fri, 30 May 2025 12:53:31 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org>
 <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
 <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 12:49, Bryan O'Donoghue wrote:
> On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
>> +	    camss->res->version == CAMSS_8x39 ||
> This is not correct - it should be 893x since 8939 and 8936 are ~ the
> same SoC - probably 36 is just a binned version of 39.
> 
> Anyway the x is the least significant digit.
> 
> Please fix
> ---
> bod
> 

No wait I'm wrong 8939 or 8039 - when adding 36 we will probably just 
use the compat string to differentiate.

This is fine.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
