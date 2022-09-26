Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B7BC6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 09:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbiIZJYd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 05:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbiIZJXy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 05:23:54 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231EB43610
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 02:22:45 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c7so6668814ljm.12
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=2VvwK3bkugyho7dy1b+Evf+o+mYSXmzCdvBHQaGe21Q=;
        b=RTWtjcMOypZmdd6bxGc8racC9Tmvc4aM0UCyw5YHRSx44Io/S6BFUKLi225viGJdQk
         lZgRE8phtA7nKcyj/zNEfIZZhIFKbL4vS1baEcNjFsHzuhbBKeGYfOJ5Gm+aiFtvAoHH
         lP/kqaendKfI2dNzM+zljdyWsGNKjZyMDxiSsqmgWojMiAo3ajsoGlIxHsQ7JtKW5Rzl
         duii4/BTKB0E/aDNS3OGlZtIt8zECqjVJNn2tD0ugweTZUpzRXDUvcZVa0TDKFBLDzi1
         qFpJ2Sf1vrFD1y6QSBvwi+GoDcHQJRsJs6KsuLfimoTAR4k+VIzpWJvs+GGvrEWv1vmW
         xNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2VvwK3bkugyho7dy1b+Evf+o+mYSXmzCdvBHQaGe21Q=;
        b=Naa1FDf3n9ARmtcHDMTudbF270PsmEs33KNd8xFcRxdu2BDvB5MMwd3lmLdFwVwC2r
         apGhrR3ttuazrnvbyTqsf/RLNyQmzy4oKcadZkr2upjMSxKvUoVwsj2vrXllUt/xL7ql
         IxI7GiLh8PhFCgOt9BGFW9UT3uINXDi5ASnexG3TMui6Sl7MW5NssMvsnxcf8nkv6LE4
         e2dUsrX/5fayte+N1dWmcNZPGSBoPt31SDzeWVFay0J4kphwlQQIh9Y1FwndBfvDxRVX
         D4NpSrmhsKKrX+rmsCVvTEqBbgXYprvxpTwt2M9Z1hgZPtGNl3cb5pjdeMX7347quJY6
         u/SQ==
X-Gm-Message-State: ACrzQf2fGv2yzbwMjsFLBZnz+JX7c2m2KW37j03mQxZQx1rFZR2Hqu2n
        AKUBPftu7+h8AHv/1HyE4UIh/978zshDyw==
X-Google-Smtp-Source: AMsMyM4LDLb49M6J45rJoRgTAM3btGXUZxz99HrylhhS6n4LdR9GtC05mKNro5GfeAtbnMLYhvumbw==
X-Received: by 2002:a05:651c:1112:b0:26c:7323:3f2c with SMTP id e18-20020a05651c111200b0026c73233f2cmr7163981ljo.4.1664184163228;
        Mon, 26 Sep 2022 02:22:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q2-20020ac25a02000000b004991437990esm2477163lfn.11.2022.09.26.02.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:22:42 -0700 (PDT)
Message-ID: <61fbca10-7a9f-aa74-8ed1-f5264127e4df@linaro.org>
Date:   Mon, 26 Sep 2022 11:22:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8998: adjust coincell node name
 to bindings
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
 <20220925210229.128462-3-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220925210229.128462-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 23:02, Luca Weiss wrote:
> The pm8941-coincell node is supposed to be called 'charger'.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

