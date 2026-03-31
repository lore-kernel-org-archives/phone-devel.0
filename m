Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186E4534AC
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774992158; cv=none; b=mHe5oCWy4KeljhSQLuhLEr+GNrS0ECb1GqJkcGM3otGsq8YI2Lcr4ScUiwfB1aek1FJgNj3Pudy9eWo51AQKgw/Rmbv1JCRa/K4WNFQBxEBJaTBpSOaCTZ1VenaKWWK2oSycKpYaNwaRTN5gVt1SFjKdDAKbLoALOWsDy4FmirA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774992158; c=relaxed/simple;
	bh=uwkdlpWgq7m+FJ52JwOjJT59fNwjkGLpbAiJPGbrgqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJhevmjzp21bOqgYdTrcle90vfp5xfJu29FRZDbOTUqDesS68GuKpXGsGfqQ7aJNgF8C0grdfL0TV1t6bDWDeVB37e2+C2Modia5ODRFAq8SPgsa6pKPo+ouCSIDAkrL5Pk9JONaaKipOH68lTkZDT3M+fAmNLyqMP6LICUeD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOZ5jX/e; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOZ5jX/e"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c1b09d69so50910e87.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774992155; x=1775596955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=iOZ5jX/eGS7OqEJxFM1ZLRaWKd5DQIs+9WPUWes7zr4p77h72A3a6SXNz3IK4KDmQz
         0NKSgEDedjHc7PVKwIshWChJVCzrV5Z73iLwL2uF3o0rOfY86ZDTyfskLPDRYzyj4KrQ
         kton6KzsiDPXMr7XEnUQ7wlKJ9q3OcUNX8D7qqCj9iB1tB8tlYWMqQ/dag9vWkEpZho0
         Tv8yDWhDb0DqfNOA0SVV8jIF1befvdxRuRwWUEduYCpdFmGSUWH6WAFZeYWNcKeF2cKo
         m/Z1zTdSBjVZPruNZYcsX7p1NyYSu+uzhhnQiVW21/x9Mxg+GHrx+r578/POiAerM9e5
         q2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774992155; x=1775596955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCku2Tmc/ePL7URZnl/UTImZqNe4IEEZFyzUDR6AaVo=;
        b=npHcTy0Ugl5v/PajKK/8mWH5CRPZISm+AFAAxjwQwtvOWK/wHRXaggmMB24bjn4/Zh
         zMA35u6KqWO3M6sqeU0lzzaFwP72Gq/XkX/lT+Hi96QKq1Q75i69c0o2cOkEV1XFOHOK
         Xj9UqT45S6zlrM5Ez0kY7BK6yiXxsgE720AmiEVikH/6bt+tSU4nzWq07SiSCfN9Wgz5
         KzUMK2evxoFUYxLWGUpobXVOSdSFnoolv0lOjVayKfNkUCY8hrZSiGltGVDKByReqSOc
         bhUQYl7Eef2tSx4K9poEN7FaY1/aaq077H4ijWSsYb2WAsM7OHdysznnTBEIxJ9g1stb
         fe7g==
X-Forwarded-Encrypted: i=1; AJvYcCXzsGcPsTq5Y4IaFbtrbM5A47gtfrhIq9/oRMg2Q8Zmz2ut62bQFINsdBmEiGV1P/6l1Kg6v+BAlJ8Bmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqT6vdhoCDOUdKV17YqTaLe+Xyln4t3Iz78x88YTHm9qlsHei
	8rQaoLySGIT6aP2QH2QhbYKh0HY6BV5jzDbDeJd2t6szRb8LTjNW5UgenUdHuVtgT2w=
X-Gm-Gg: ATEYQzxLWkHUwl3Ai/tG4ZHv6dIYEcPihFYqzUwYyAKPrwdmrveuA1N/EYXSVxQl/0Y
	J4K0yBPAR8m+5EiQfu0AeJQPjyqa3DeQS6bpUNIFnkss5NDbZao12+pvEjGfuAY+lQ/Q5btUlP3
	FroAQzuqSEVMCr1zI4vFxFa3QQpLmJnqY5UPhdNP42g2AEOLzss7Fe9iveHSGycskxg/Pu0eezW
	i9RqmUj2bQgs4/Pjf+vt92H3D9YF8OkW+O3slvPkO5IpnbupuX7P1CvCsc8fiqCRycfoDpepijf
	kJPNClW29J7+Yt4XnjQJTq+ejdN3hSr9Ao6SpuaWtn83+sLnqycmZe3jDCCLqDG+K3eAC7olKYo
	6njLgTV39ugmARpk1dhSoc9xgmZLPQ6hNnoDHJEeGXX7WQtxflm/KaJfjtr3SVYJhsblg+/YLgZ
	5bs1OXAc5wb/iA5XQy89eltY1nZ4zx3CBDnc7+9GwEB6e+kYjhCKCTP+/x3yjKJbC+waV5s841y
	F8wtP+BL2fEWwpO
X-Received: by 2002:a05:6512:39c7:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a2c1f4cfd4mr185134e87.7.1774992155413;
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cb6sm2725447e87.27.2026.03.31.14.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:22:35 -0700 (PDT)
Message-ID: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Date: Wed, 1 Apr 2026 00:22:34 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260217002738.133534-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/26 02:27, Richard Acayan wrote:
> The clock-lanes property has no effect on the hardware configuration, as
> of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> clock-lane property"). Since boards with new camss support can omit the
> property, remove it from the required lists.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

If you send another v10 of the series, please remove 'clock-lanes'
property from the example as well. Anyway, feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
