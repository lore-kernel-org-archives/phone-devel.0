Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9c4Wvwj"
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B42D5
	for <phone-devel@vger.kernel.org>; Mon,  4 Dec 2023 02:41:41 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54cb4fa667bso1259298a12.3
        for <phone-devel@vger.kernel.org>; Mon, 04 Dec 2023 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701686499; x=1702291299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=28XgFmjfh625VXQFy6sZqO8571DU9BRuNNIufn2+gPU=;
        b=M9c4WvwjCH2GqMt457VU8JRuEfaBSNczcs4PhswAg6o8QgoKYxvY3PYYf1B5vbP8fD
         bIpAnjVToe8GuQBsiS77jMdP2uabrNa3DluyBFGSbueItcVG60lYt3sKJmrVtHfNv9L6
         yOAgfmhN6IiVtgL2qzRK56Ou16cEE9jk0McC3uveUC1XTOTE3zZ58LNXhRVP5ADGlgGk
         nxJCwAC6JqycKE0sJJvlQnx/O9OZD8mDUvEhWvS9sptpmVwbC96aJddBMxzqibYbeJ4c
         jYGhWleV7p7CbK0oRH5pVYYZcanaPgVOUSE/xMUMxdb3303gM4DfNuEaYcAG4Hww1nKw
         Xl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701686499; x=1702291299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28XgFmjfh625VXQFy6sZqO8571DU9BRuNNIufn2+gPU=;
        b=RrtInqlBNsUY/EtPqEAkPrGdNVNn0FySdHmIJy/bXKIZrHQSVnDRZB9ZVuXUW5Y5gW
         EqtcfAXtl6+rJdf4B7MaZIwBsamhOVxk5yftdtZPrMIjaoJKcr459G6tsBtcVtaM6P6p
         S2OuZksi4eliIckxqhgEYlKFR61C7HiR1Aju37g/PeTQamPgQ/Dt3cqN+9ZrXZ+7INUC
         CxCkahTj63hwigTGM1JwTKJ/RrsduWVfbuAPerInKlm6/FCdONn5n3KEu+TH8ogMisUZ
         JyQt7c3MHQrnI5LiJ7SqbPjUD9UJtMfcNjD55v3j1fSBUJ9q8sXMvlLVvVR2uKDbAVMM
         2uPg==
X-Gm-Message-State: AOJu0YyN2UZU5kBfhuUvo8oMHgvEjqfQb5/w4KR9DHPlmPH4X6J5X8zA
	Ze76SYtGuRqmtU8OObGDSG88pw==
X-Google-Smtp-Source: AGHT+IGV3c16x1plImWbu4nV2P7vZFQzLSzQQ0a4wo2sFM+k39x6r32KdecP4qbMSe6wnKvfQetgfA==
X-Received: by 2002:a05:6402:22eb:b0:54c:d33a:5ea4 with SMTP id dn11-20020a05640222eb00b0054cd33a5ea4mr532856edb.65.1701686499621;
        Mon, 04 Dec 2023 02:41:39 -0800 (PST)
Received: from [192.168.209.83] (178235179097.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.97])
        by smtp.gmail.com with ESMTPSA id f10-20020a056402354a00b0054ca1d90410sm1985488edd.85.2023.12.04.02.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 02:41:39 -0800 (PST)
Message-ID: <d1f1ee82-7997-4e36-a21a-7b70d2db9746@linaro.org>
Date: Mon, 4 Dec 2023 11:41:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20231203-msm8226-cpu-v1-0-d18e83340b32@z3ntu.xyz>
 <20231203-msm8226-cpu-v1-2-d18e83340b32@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231203-msm8226-cpu-v1-2-d18e83340b32@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.12.2023 23:38, Luca Weiss wrote:
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 
> Add CPU and SAW/ACC nodes to enable SMP on MSM8226.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> [luca: update some nodes to fix dtbs_check errors, reorder, cleanup]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Looks like L2 SAW (@ 0xf9012000) is missing.. but then it's present
on 8974.. but it's not bound by any driver :)

The nodes you added here look correct FWIW

Konrad
