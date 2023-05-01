Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AD5C77B73
	for <phone-devel@archiver.kernel.org>; Mon,  1 May 2023 06:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbjEAGsm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 1 May 2023 02:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbjEAGsl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 1 May 2023 02:48:41 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ED610FE
        for <phone-devel@vger.kernel.org>; Sun, 30 Apr 2023 23:48:39 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94eee951c70so352638066b.3
        for <phone-devel@vger.kernel.org>; Sun, 30 Apr 2023 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682923718; x=1685515718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEzqDqyF1fkxeu46gQQXf499e+tBTdeKbHMx5PIiC9U=;
        b=he27vMCmazRDCdP2UIZDMqSmRu8TLSNe7lqyN3gL/yfk1FWjGq8PRIhKfKpmJjcdxv
         LYhgCGplEeAStVi9ShBeV3NWuE85Dz2oTQlr8d93JUyDeuHyU4urA4HUdPvir7vbY2jC
         cx2MYsjJ/kw1xStTxVsHiEOHu/OCH2VNUtE+hK/tiyLyFqNok8Cse3vAdj/LpQ+M8NRR
         ZOo04tqTGO2ASeVO3OLzBbFfDiWYtSEIw2cBTOK6k7N0fL7bu2zTsa547kKYFpmgFfoq
         YX9JkYrkFXREHuTaTuqTP2MDm9LtvsMEtmkW8ZDIJ05PMb9vg8Ov83FqFfSDaQKIVdUe
         e4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682923718; x=1685515718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEzqDqyF1fkxeu46gQQXf499e+tBTdeKbHMx5PIiC9U=;
        b=EcWSgO68McDSSTHbkWaNUvX7sn38Ee4n4jCOqmX90qwqNLmpK6VCYzt3GLcSPDEf5b
         Y5GMRZrGmDs8e/cQ4apafNPpIQzQeYW4poAfhuaU2/FiGgoN+I4ST2+TtGppHkXQf9RR
         fEp6LLvrHjp8SkoGzVOC9FG5skgPOSaIlQ072UtwEF55mgsIAycEHiFH7hNllA7bK72O
         lZ8NYMZwv0lsF2ZFdl8qvXrUus3Q2K7OM9WhSijOd/fq3ufYxC+dWZMm2pY+M0uJv0L6
         Qm9TAgv4+MVzlyoOQipfu5gKbKwHp1PGz3Xzvhdy06feea1f9vN2GVvS0ju1Kh7QdETm
         B/PQ==
X-Gm-Message-State: AC+VfDyDh+1R9a8AjLbeGjOo7/Z/kUrFaCBQZ1MMfAB+v2U33zjlcBJD
        0eqpAjRLlSMPY9wAov0pw80AEw==
X-Google-Smtp-Source: ACHHUZ4Q6p/XHwNyndmaEJ23rDH49qKuDWOaJMg5SeJLPfTlqJWWYjlFBfjnVbuzkWtuvL9+SogO6Q==
X-Received: by 2002:a17:907:60cc:b0:94d:69e0:6098 with SMTP id hv12-20020a17090760cc00b0094d69e06098mr12514106ejc.45.1682923718401;
        Sun, 30 Apr 2023 23:48:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id ww9-20020a170907084900b0095847a49ce7sm11671109ejb.55.2023.04.30.23.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 23:48:37 -0700 (PDT)
Message-ID: <deb69f7f-f0bf-f354-6388-b23dbeeff90e@linaro.org>
Date:   Mon, 1 May 2023 08:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] dt-bindings: input: pwm-vibrator: Add enable-gpio
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/04/2023 22:34, Luca Weiss wrote:
> Some pwm vibrators have a dedicated enable GPIO that needs to be set
> high so that the vibrator works. Document that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

