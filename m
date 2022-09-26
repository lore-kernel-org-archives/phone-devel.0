Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330D8C32771
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 09:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbiIZJGb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 05:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbiIZJGH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 05:06:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF0838449
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 02:05:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s6so9773088lfo.7
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=k2TIN9QxFT3reJpkn/BptgOACbbdJV9YpVLPQhFkBEk=;
        b=Rqwtb9f91+sTbwE7y+DU+10wvNuX/H0SrRA/Y3+t5nc97jejXNzzXnCRnR9Ze1n2JS
         I3zql/DMTN+muJ3R7MWGlr6cdM8Eq92R69dKADTamP633yQxpTyec231IakhrR5uUUAe
         qJFOGGjdAUlULyZBt9FWMQZGgpP/lhFS9yNdokfDGz9sImBQHY4TSrzYzb2H9PzzcZwc
         q/sUxQ2XV99cBKupF/sVFh2Q0AEHTYasNsr6iK+rEBxdE/lKzFUaeXwRh9/IRUPg4WPU
         huNXUVK3Wty3USw0qjgcZw1OeHU5RR23FMwOeojwV9/1U6RwI85x5rGSSpE85OU623pW
         cHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=k2TIN9QxFT3reJpkn/BptgOACbbdJV9YpVLPQhFkBEk=;
        b=iXd1nxkCBb47OAOMdBG3PlyrHgwmO7QUJicSyX+Ggh0qkpvHf8nSCfB/Msmi+KCYxz
         6Mb7BDwsJXdItbgmPXBNC9szAKFTnSu7zAmPoWHk6ob+gcO7DmfGCrFVbFD7RjGiKVio
         ql6CbDo0+gHyujkX5RN9a+y935F2sC3ilKyy5HJyXR6YChnwEnYhKyycY0Ilh2e79qGy
         BAS3cjPksIRst4XE6TsJLz4s8p91FKK0R+CEv/+hzv/xQmq8Mzyx1n0IDoTwHdVeyvCK
         cUSM91lzwNxdpnKA25LyL3P+1YfNiv+LCgXOOqvZBOOzgw9SaholpHyNoFy1TZ5QslN+
         +RLw==
X-Gm-Message-State: ACrzQf3s9h0I0Bsjgj8TglIo9Y/z0QrWt2R3Urf7Jv/G2asjU0LvWIjR
        t2Dw7B+PDXklQYZWmRxUlpG07A==
X-Google-Smtp-Source: AMsMyM5lapFZLPdc0wTu312cgor/Rqb7iADV+fqgl8mvKQaVtWaTz+qEw8bSCiiZUT+y4yW4Id3IyA==
X-Received: by 2002:a05:6512:10d3:b0:499:cce2:37a8 with SMTP id k19-20020a05651210d300b00499cce237a8mr8187766lfg.169.1664183111555;
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0049c86ca95bfsm2484075lfr.52.2022.09.26.02.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:05:11 -0700 (PDT)
Message-ID: <bc5983fd-7d5d-427e-e9d2-a800dee0dc3c@linaro.org>
Date:   Mon, 26 Sep 2022 11:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: fix regulators node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925210229.128462-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 23:02, Luca Weiss wrote:
> Adjust the node name to match bindings and fix the validation warning.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 2 +-

Thanks, I missed it in my last cleanups.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

