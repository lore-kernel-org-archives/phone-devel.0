Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F11375
	for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqkkL4Rc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so4912369e87.0
        for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704908444; x=1705513244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh6Goy7NRtSRzQyxaJrI0RtgCTicSCtruZk0IoQJBRY=;
        b=nqkkL4RcRCH5ufNXbHWGnxSoi46EXvz3Jq65MvlJ1rvX3fliG5y/SWj7ez4mPYLGfH
         DDzG8KohbBUkqdX2KH+KSVYUSWV8rPUbS6gISFAuul7d7fuzHWiQUwkMSJ/OrUUCJVc2
         yivCWneWJQM1jWYM+34g+ijczbZcn9u8S5mXShHS6pmuaVqXB3xFyWU/Lmva11LuhIn5
         Q8c2jbT60eSc31nQa1pwqzgERbFr7e+Q8MN35+3iL5jBdKmVln5dNuSQE35KXRN/u7p9
         u8Yfzr4moganbFSKFIIGwHzpJkzdzeNnoVGjL+1Pk4aLT2oLGpqKkS8E2aDsEN4sctzL
         V+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704908444; x=1705513244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hh6Goy7NRtSRzQyxaJrI0RtgCTicSCtruZk0IoQJBRY=;
        b=I56vxRQGRs8V91wEC2tf3VubXLzeaqwLJi9GbUIX+W+O+C+xPp5QzNYKYDD3/TgXyj
         3C2kEpZHBkMEapKouxVaI3mFQuYMbUlcaxKtG8UmVg/8JmsxpRq5oZpraD1vhvS/K4LN
         e0EJFCFU7slpNHY1Isz+4nSZg6beE7EAB3up+MaDbDpCO4gHIKTDIH0IYFBPMGFmS0hJ
         DqWGtqC1f/XqH/VeJU+uPKw3WXqWTVi0K9gl0VK0tJaKoXjuRNqjJHFuu5UChVccD9k4
         NQ4qmaM1jktBGz8hbaag/Hztt60qWdAVKlS5+S4P/HXrOtqLY3cpQIlmPPFGf1YP2rL1
         fORQ==
X-Gm-Message-State: AOJu0YzXyS1BFdU9ylvPUTdkmfrM5MoQMwp9JwPEkrUdJeCilkiRj55q
	1j+xaiJoD5Wt9IJeRoxslm6hLhYWNZdQgw==
X-Google-Smtp-Source: AGHT+IEYAF/qKxWaXqzKRy2E22Nw/2yDlQi3jF92SjU+pffbCOmE6KDgmi6npRBp4cYRZGyr+gEJkQ==
X-Received: by 2002:a05:6512:124b:b0:50e:7410:d5b0 with SMTP id fb11-20020a056512124b00b0050e7410d5b0mr731181lfb.28.1704908444428;
        Wed, 10 Jan 2024 09:40:44 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a27-20020a195f5b000000b0050e8cd014d7sm741726lfj.16.2024.01.10.09.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 09:40:44 -0800 (PST)
Message-ID: <dd06a04a-ba02-40a8-b5f5-0457085c202b@linaro.org>
Date: Wed, 10 Jan 2024 18:40:42 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Switch firmware
 ext to .mbn
To: Luca Weiss <luca.weiss@fairphone.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240110-fp4-mbn-v1-1-45e7e33b1834@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240110-fp4-mbn-v1-1-45e7e33b1834@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/10/24 16:21, Luca Weiss wrote:
> Specify the file name for the squashed/non-split firmware with the .mbn
> extension instead of the split .mdt. The kernel can load both but the
> squashed version is preferred in dts nowadays.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
