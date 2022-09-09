Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E6ECAAD3
	for <phone-devel@archiver.kernel.org>; Fri,  9 Sep 2022 08:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbiIIIZq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Sep 2022 04:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiIIIZo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Sep 2022 04:25:44 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121154B4B0
        for <phone-devel@vger.kernel.org>; Fri,  9 Sep 2022 01:25:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so1440699lfo.8
        for <phone-devel@vger.kernel.org>; Fri, 09 Sep 2022 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FdkeN45+bpzn92GuTJsvAHffS0/CIgbdMCx/tHdOYZc=;
        b=jaQcvdJRg763YYgdwLo8KSl1ulYiKmO6nCev7fjRJSfsDBd/4r5N5791QcL3at27EK
         a62cQDjK5HiUYjDxqcoVF+iPFiLO0uoZ4Iur3BUyYnVU1YXWTfoU4aDAwkr5cHCebiuc
         DKKqgubknUvBciYoh0PY4+J+jffAZ/DiOFHFMfHWilrj3/5IZJJmA0GLRMH7ogtOh3XI
         2ZR3BYVtMTzj2sS9sBXOY6tnAgsyAnOnfgzBn9V4myili1RXukmd61bRzzL1xKzrWqI4
         rtGJUBOTYiAu4tCDJgycXBan998pVXshYtbeQURg07f6TLC9NoIdZwakMMeYn6+2nXDv
         eQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FdkeN45+bpzn92GuTJsvAHffS0/CIgbdMCx/tHdOYZc=;
        b=gzaKr3nBo/cjrj8a3t5xMGnmf28Jo9pGA4so9CJ2riXqdd0Ygm7Ah5kfz5GfvPiIU6
         gwzptZPgWYy2qoOsOqXwYFB6hH33KG6OFwJ+WrwMSyfLshE/h/DAG1yN0fghkUeh/tlb
         k9RGrhN2rxQZ1/yKEDyAvVY0lYx4p/zONX71xp1Un3+SfpQ6K2yLX4EwtLIi4kKSj4Y9
         ehfMHB0WccMP9OcKw3JRl9zgEiYwy04WhpcOf1LGvYKlFcuAWhAFYLflosxuNnYqOa8/
         uFH5eTZnxwY/kRUSwggQ5fR0qt7A7K8tAjy0dxs0qnTrs8oDfRNL05TSrWL1gD057ARz
         btvw==
X-Gm-Message-State: ACgBeo0PTFAzqv/fNImz/Y+MuU8q50Ws6ziRJR/bZgyHvO7F7l51wsUj
        qFz1fU43HtHkdnyeHmahjgqXvA==
X-Google-Smtp-Source: AA6agR6sXGaQC/MGJzYgm5A/kkMiHKD4dqdS7hGBSaJrUpLAeb1q6i/CUX1vmLcbcRKk4rCOrB8OiA==
X-Received: by 2002:a05:6512:159a:b0:492:d0c8:aec1 with SMTP id bp26-20020a056512159a00b00492d0c8aec1mr4300245lfb.275.1662711940468;
        Fri, 09 Sep 2022 01:25:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b004946c99e78asm170519lfs.277.2022.09.09.01.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:25:40 -0700 (PDT)
Message-ID: <fdfbe7a3-73c5-01b1-1d71-3ba3c1f6f143@linaro.org>
Date:   Fri, 9 Sep 2022 10:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: split beryllium dts into common
 dtsi and tianma dts
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220909035447.36674-1-joelselvaraj.oss@gmail.com>
 <20220909035447.36674-2-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909035447.36674-2-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/09/2022 05:54, Joel Selvaraj wrote:
> There are two panel variants of Xiaomi Poco F1. Tianma and EBBG panel.
> The previous beryllium dts supported the Tianma variant. In order to
> add support for EBBG variant, the common nodes from beryllium dts are
> moved to a new common dtsi and to make the variants distinguishable,
> sdm845-xiaomi-beryllium.dts is now named as
> sdm845-xiaomi-beryllium-tianma.dts. The model property is updated to
> distinguish between the variants. The compatibility property is
> moved to the tianma variant, but it is not updated to avoid any
> further conflict with other projects/users that might depend on it.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
