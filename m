Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACCEC433F5
	for <phone-devel@archiver.kernel.org>; Mon, 25 Apr 2022 19:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244155AbiDYTGZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbiDYTGY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 25 Apr 2022 15:06:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8911012C411
        for <phone-devel@vger.kernel.org>; Mon, 25 Apr 2022 12:03:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b24so19584085edu.10
        for <phone-devel@vger.kernel.org>; Mon, 25 Apr 2022 12:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bWSwqUBLHXCajjtitEjLPhdFWmWql/C3V3lxwBrGnrk=;
        b=WCeTJciFtzW/66w6qxu9U0TCrn3dp1lNY/a9kWEoejujgT6xedg7dmNc8iCowyRbUE
         DAYU6Ub8HIDfk35qBaMyTpujK+wFaZuBkiQDYX1WqIO/wKQFjtvZiV9X+cho+/Pl1Wna
         04c+fXmcbp7uTkgqOhwyfwo/uvQ8QCiHZVyL9lRKLxcokF8MUwhtHPssVv95WtyoGOik
         gWST3llPd2m2bQPbeSCLA//icGLpSyTM8KUcjHE9V3zVZycL9rtBF4Eaiei1J0n23RKt
         Evg6hmsrLjvC27jgOQKsLuxyvYHTctiNlA5Mvgs6BzSTc/+ajOh/qeHL9vYQK/Ju9HK1
         XQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bWSwqUBLHXCajjtitEjLPhdFWmWql/C3V3lxwBrGnrk=;
        b=oSzFyCF8IjreGIY+rRrVIHvXg6ry3mIYFy/1OpVe5JwGIaXKJHAuURdkzd5y8RpRYT
         R1Nei5ANy/i1k2XS1yOoZmTYJNyrl1UB7le+F08ku1EUMnyZIlMiAVSm7jWKzKucYdge
         2W63pg4e2Sg0q0jK3d/filXQLyw/wWRSQMDELimeWrfHVFnt3H+pw9MQ5XT1H8Ws5qWo
         tKrQwaBGnD48kXsaub2/UrydVeDtIgA1PR2IWWZtt/vtlX6T9HaD+Y2R9XGRjMizF4ty
         VVGa2E05pwYnocAhXz0Jpm9S3pm/Gt3uGLDLLGbA1Pjm4J7dOIo6ixaqy5kNsXPWuslR
         0iSQ==
X-Gm-Message-State: AOAM530Pw00DwYQBEITuiAMlTOk8FMYpiWgSTHy2CIiXnd87x1x/RLkd
        x7Aiv6QGQK/XGwfFXmPSQpy4wg==
X-Google-Smtp-Source: ABdhPJyYDlKoNm52mAU7TTe1xonG+Kd0RnnjvQZdkOVFFMcHqbY6ZvHUbBJwHvD4MHRcWpQ+pPLqEA==
X-Received: by 2002:aa7:d416:0:b0:425:f5c7:d633 with SMTP id z22-20020aa7d416000000b00425f5c7d633mr2731157edq.105.1650913398191;
        Mon, 25 Apr 2022 12:03:18 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y3-20020a50f1c3000000b00425e09ddb08sm2387657edl.76.2022.04.25.12.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 12:03:17 -0700 (PDT)
Message-ID: <bbb2516a-3689-487d-95b5-df42801b65ec@linaro.org>
Date:   Mon, 25 Apr 2022 21:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] dt-bindings: clk: qcom: gcc-msm8976:Add modem reset
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220425185140.15154-1-a39.skl@gmail.com>
 <20220425185140.15154-3-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425185140.15154-3-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/04/2022 20:51, Adam Skladowski wrote:
> Add modem reset for MSM8976.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
