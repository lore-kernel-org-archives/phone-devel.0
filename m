Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD76E784B0
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 09:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbjJBJP7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 05:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235965AbjJBJP7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 05:15:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9477EA4
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 02:15:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50325ce89e9so25884805e87.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238153; x=1696842953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTFxgVOu6FqWzooz8ERS8xM8WPaMS6pYudSyg6T5KGE=;
        b=Q8a5ie5NnUnsqKHu4PrFASCRpmQujPv25B0MS5CiBzia/6gCkeTHlE68bmPGtZ14e1
         GjUPKR6oLRG4Hli+YfOUP5dEBATV2FI9Roox20QuCue8YyQ2P/igeSJbpJbtDI6djKk9
         YRnkPzuk2+cCc3AMbQ72rVl1ulPtcn37saxXZ/uC6M+TulKG5Pcq2JtXFC5yh20p+8ag
         HuFKTtxgE/j95JWanANMV7wxMTF0qkYyDdswP8L8qcZ1T2BtdMLaJqq2CLSteEdf0Yjg
         69VlOqkNxyEENdVDwdUVf+C9JYBAR9vkOyFhU4R0UjkhBOMN/wu87ATKlEzeNakRWKZQ
         Vpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238153; x=1696842953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTFxgVOu6FqWzooz8ERS8xM8WPaMS6pYudSyg6T5KGE=;
        b=bR+sI4b7/jV/X49N/NnGVx575FztAZEY5VM16OcC8K9YwxPT8OuIXaEzkzDkqCabbj
         wxWtiboA1mStfqaM7zIiDMWv+tHSGPNKSnlwXjvz7VUu/twvr81dt4b/SIQHMhEn3ZZw
         phCTIuAnwL+nCnDVzx0WMNYGMW2nZarYCED+qd1wXWBFE7+/zHTUn9PM0pfPAnP8cV5C
         PMqECIZucBdyJD8J6W0OWanLyRg1sMt4k/4rXwbQUYe9cZXcqaTJW/h08kVMW+mL1LZo
         m79RCkOaOG3Xr1QQ1be9I/WAmUoJgNQFjJYT7bp/3a9kBTvII043L5IZFb+KExxiJ7fs
         1fnA==
X-Gm-Message-State: AOJu0YxOip+SeVehpul2RoUPT9JgH9hQFvp2tvBOBWNU7mJ05aBZTMqr
        lFrlkTsLYBFeOcZIQ9GqS94urw==
X-Google-Smtp-Source: AGHT+IG7MFpGpFBBFGxenUypPs1uqY9lxRFgjFyW+IeEhpy3S168urO5h+mvMFwpIIgF4Xj6SANX/A==
X-Received: by 2002:a19:9141:0:b0:503:3cc:cd39 with SMTP id y1-20020a199141000000b0050303cccd39mr8161061lfj.8.1696238152842;
        Mon, 02 Oct 2023 02:15:52 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t5-20020ac243a5000000b004fe26e36350sm4660646lfl.253.2023.10.02.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:15:52 -0700 (PDT)
Message-ID: <41e07183-e4bc-2bd6-8bc4-f5b6ab7f472c@linaro.org>
Date:   Mon, 2 Oct 2023 11:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable
 flash led
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
 <20231001-b4-sdm845-flash-dts-v1-2-275a3abb0b10@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-2-275a3abb0b10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/1/23 19:19, Caleb Connolly wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Configure and enable the dual-tone on the PocoPhone F1
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
