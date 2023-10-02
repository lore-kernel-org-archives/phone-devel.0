Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46769E784AF
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 09:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236002AbjJBJPs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 05:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235965AbjJBJPr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 05:15:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8F6B3
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 02:15:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-505748580ceso2574145e87.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238142; x=1696842942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKFgAZi/L0N2kp9XV6Gn5/hvFVeYhucp7Px8g6ewoQo=;
        b=fNGkKexhuzgLEeVpkFKN8w0ybe47T9Jsz8vWB1GNOkG0zW3Cb/a+oTk9uGbY9C09rx
         2qzZxWIg2JDpJy0+S9h6DKUcpIb3whVQBl70/qVodKP5NE/X6TLSLYeQVgwW+TCIzwBm
         NKXw+A9yUtONRBG3pa9SvqF4DzWxxMBVjSddaAHS/5jeXzge1XdHIopORf2g8AN5PiUo
         9oTZyP8oqjSY1kvOlMgHBPGdLZ+iyJeE60wkYik+PVfZ+PJYqWaWgmnZbFqLgy+bK/Zb
         iQabvdG1MUx2Bj7LGS/bKfRKX3uDj988zHonbqn4z3g1hZc26D10FXAQPD9JAuoRhCSw
         bEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238142; x=1696842942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKFgAZi/L0N2kp9XV6Gn5/hvFVeYhucp7Px8g6ewoQo=;
        b=rOF70oM0MYTE6tk/YuQjRPJ5carqOzKn227sO4a+1q92jomYGQlmeqg0ukkM2F3F0F
         e8Jh39f/ioGPALU+Ab1BZiPeSRdWTgTxbR7q5Yrz7Q95F0EUlQ4fTB1HRz1y8xjQCcmX
         bUe2AOZBrGbpMX4zIoTY+yDElAZ6My1AQnhE/sYIkz+ewcBpvXvl2TfWsWvfmwmFXj6Z
         0gBlZ+UJta51ffYnAV9Yf3oE4j1IRfO6pnvrUAeTT7tAwu0PQ9Yv66BrN0n6EAtDo0bT
         p9CipY7RliCWsJlQJGmwFDsu/ioOsbCUqRRTredCWzZWFULcy0lw++5uOT8qOYk9qofV
         KTVA==
X-Gm-Message-State: AOJu0Yw0bx3u/SdVDAUHIZDmKglPdFkqQWg1VX+C/GfgJEQJGCMktUi8
        vfm2asjf4K+DiZEKcfwTZLZeUA==
X-Google-Smtp-Source: AGHT+IGa14XP+UqD8pYmtIu92W58oS/MZa2G9p8QeeBfIWcQQPykrUqAviYI11e1nL5dRWwmQFPPGQ==
X-Received: by 2002:ac2:5453:0:b0:4fe:8c4:44fb with SMTP id d19-20020ac25453000000b004fe08c444fbmr9238541lfn.38.1696238141849;
        Mon, 02 Oct 2023 02:15:41 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id w21-20020ac24435000000b0050307304a80sm4674723lfl.205.2023.10.02.02.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:15:41 -0700 (PDT)
Message-ID: <5864a318-f45f-49c7-0680-de50fa2b9f31@linaro.org>
Date:   Mon, 2 Oct 2023 11:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: enable flash LED
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20231001-b4-sdm845-flash-dts-v1-0-275a3abb0b10@linaro.org>
 <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231001-b4-sdm845-flash-dts-v1-1-275a3abb0b10@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/1/23 19:19, Caleb Connolly wrote:
> Both the 6 and 6T feature a dual tone flash, enable it.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
