Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474A3DDDDF
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963240; cv=none; b=K9TsTItkdgZILQ16X7vsBO3nGEYFpIP2qfISkINYI51lzhTwGw5Jo4o8yVFIRm6C7N0qnzI/FIvMrgw9z+PWcu0NWer2FykApTM+PJxKZoA1CMhZHSVVVLGhxvMFCI7HfA7swdmo936AE22JuJPDHbSPKmOffkpqj5Af+GZNSp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963240; c=relaxed/simple;
	bh=FHCG1eyKPTFyYzgTJ8AuOuQbuY4G/koxwDmMSh7hUqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPDNmYyCATHOW5YuIK/YEyFbhpvw5S2AEl6c9uoCf9+XmpZocOH8W/mAbFU9Kl9bPT0F09Vf3RnwWZrYfMyAYr+AmJzo9sdH3DBgrJWdXTz83QQdxGz/Jmj+kVQYygSXaHwgKVRLxAPRktu7OlTgeevohwUZja3xKZNbA8HSVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKDlbfPN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKDlbfPN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso30290e87.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963238; x=1775568038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=YKDlbfPNBYT/RzZYT0AEy6bhZdIHIaPWEUMKgdo8Qw1uLVnbYcmnuAON9e+9NWXl3I
         TVPzZwo4e539EPFMnU/Uuj98yNLXnYyDgisFZdhnDkqPTZOnEFcVmMjpsAhFp/+0ASi9
         o8RE7rGXKvak62nMUm1uWGjH1iXRdSk7qVMoIK2jDBf+OE4RPcuMoXTETfgkONUqmftO
         Tmh0k3LcKw1nb4dMHiy5uK/sRPBlBL6WjR0oIIKOLhDas5M9iRdJ2983ZszUmwCIc2kx
         Li8dilXnUx738GWXm8oyn6cjrWcrjMUBeBwy4Kttf1qg1b508IJ5I1L2PK29FsCDitpY
         8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963238; x=1775568038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Fd2h35A9jrPAd01iGaIxV/0FHNMxJJdX6ssgg+Eiwc=;
        b=ktcRFtrJOP3AWqLAf1sbOLtpbN/wfWiloAhNyfBws8K7q9Ms0hEpY47ghP0oEuIX76
         knaO7Sc5HWEpLioyiaG1BcCpgocfIpOXr9zf5SiPowlLEU/T+FuII0HWgjpAmmxaVsu1
         NasvnQJGMnAIEX5r5dsMvaipJSZyzRVhLk7wSZLq6DULaO/Jk93bPwy9yZziBi9n1/yN
         k/F0Z7kOeMfEB+6bqOGfNM9zrywIiG+OpeOEn+RZ+JGstde+YLCLzgvmfRmE+/4u1ces
         jhN6TzyNDQGO71J6EANuew5T4ft8Met8jU37UsZwKVXB8gwkrVUz9I9QhUhDp5v5/SgM
         GZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkRJu6X74vtiqNFfZ8VQijJ1g1QXohwnBU8qtemCd2ZOJOdyJLjAu2bZ/Qq7ybn7Y5C6GBEV5xtGK67g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtFsggBPHawCHR8eIjwEqsLs9D9guQC169jr5x4Z7FC+bo1Ig
	ehHZMwz9uX3JUVOyd/u4izMxkHZ7IK7QYx7euoqUkTHIKXDPpa5pYv3Iq6LuWtDqy8E=
X-Gm-Gg: ATEYQzwdPfXOWnv7G6PiO4V0S8fOD6n1l/pTEXANFtnOZh3IbOMY/hzmmcExQvQA5dQ
	4BQtS8LdPEArJO+KLNtSSgc+x8deXh6/DVW2ObDqq1StgHNBbAcuoZa1ncb0NpNM8OdZbEy1usr
	wYFrKpSJpQ+vXQrIIih5ELqGdx86vwuu5deuaOtnKkcc4XkulK1qTmVvqWlXUKPxIaB8GDrb6sC
	KbKl7nJnxL8LyrbYbJ9zsWVtpkgBTSNZzl64Q6ozDa0+CUAXOkNUh7kyng9zfrWf8w9uPIVD+5+
	C1fDdIgniKH7s8LA7ZMoGeOA1IKcbtSorSJXJLtEQJTwBfDVw9ICVBPGkhDg9fSo8XLnA+IKGVE
	g/T3QEN1xl9Q4JpqhyRl2J6unCT04yI4Ubq868dI+ZRByOw5oZX/RY4/IJS0r7gvjAZBYpl/5n3
	57D9k8HWTSRPt8AMCUJGuhm1Llg0SV+saoomv0YG8JbUQshsmjX+Xw9hb5AxWpv6IcycurcXGwL
	gFbxw==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:8516:a52a with SMTP id 2adb3069b0e04-5a2ab5fcfcamr2769606e87.2.1774963237655;
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4d3sm2395494e87.34.2026.03.31.06.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:20:37 -0700 (PDT)
Message-ID: <bc4579ce-294b-4553-8166-55cf4888c6a7@linaro.org>
Date: Tue, 31 Mar 2026 16:20:36 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-2-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 10:54, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
