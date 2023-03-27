Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6608CC761A6
	for <phone-devel@archiver.kernel.org>; Mon, 27 Mar 2023 19:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbjC0TfM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 27 Mar 2023 15:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjC0TfJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 27 Mar 2023 15:35:09 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58091995
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 12:35:07 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id ek18so40699566edb.6
        for <phone-devel@vger.kernel.org>; Mon, 27 Mar 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679945706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CipNcg6XGhT+x225ozA3jqRgRsy3IVzOurOagbBJ054=;
        b=IeTokkfm6UWkOYDDbUa5a8dEtSK25HIxP3MKONEl8LYvz7+y2mO31PP6B7MD2M+80P
         8eA9viEpDVpyZaONFCKJ3VYa4LfYhMTGVn4FPKls46k0RDMS6LRFE5CIVO+33+SXAT1r
         dB0xjiPUwKXHTz3EEpThy6HPIcIWOFckY0F7wDIa2xg2pJvLKc3UFKN/R6WN7YbkpI1F
         HYg18/4cHbLLEnRI+GesvpGlQsPhUAnCMgcQl7HXCbQ6UGffvQbkyGfl/4BEzK6SmwPL
         12TtBD/LhsTFH5y88WWNlJjn3v085uU3fXQ7obGEj4vrwth+e9aOayJbNzzZ+iP6hBB/
         zJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679945706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CipNcg6XGhT+x225ozA3jqRgRsy3IVzOurOagbBJ054=;
        b=fuFrRWjyIbnCpBoERqoFY1m2r1Z4zjm+O1BBsyrWTbRtW+fvDtM9qpnIJbabrCQSoA
         f8dcU8NmsOwheGn/vClHgrtyRx23FxMWVgXGFG249lmXPGm38bMRT06htaQSeknAPMSy
         8a/OYNIDsn2NfU80qNFBfClgKs3lnhV6tVaVwFqGZ/u/THIlzwGsViZLXxEi/71hL78k
         tfV/z46h1139qX/QxJmqBzzNFcvqP97G69fWGCcKcL5BOb6TMXgru9Es1lM1oeMh9v19
         SY5pLWUIEKvKRYhS6pWZUvhsIkzvRiv9MtTM1L9fe5xO6cypGndBW9pcXmq2+clw+fzU
         SjMg==
X-Gm-Message-State: AAQBX9dA2dmJms3iB7FbA+PQ5Spk5xqIMXbd0ZjkCHseW3sliotUPOWM
        6BX+d27Q7m/eFcEECAVOjnwoig==
X-Google-Smtp-Source: AKy350YtrtGg8yqJ/C9YGnzqneUXRLN2+3R7BFncNFhFLbFR1CFy/RSVxt7xVrbMhYi973wLuPSvjg==
X-Received: by 2002:a17:906:3607:b0:92d:44ca:1137 with SMTP id q7-20020a170906360700b0092d44ca1137mr13605161ejb.43.1679945706240;
        Mon, 27 Mar 2023 12:35:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9314:a4b3:ce49:2c6b? ([2a02:810d:15c0:828:9314:a4b3:ce49:2c6b])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709066b0200b0092be0d267besm14577954ejr.142.2023.03.27.12.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 12:35:05 -0700 (PDT)
Message-ID: <8050df0c-753b-1733-962f-b4065500a090@linaro.org>
Date:   Mon, 27 Mar 2023 21:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] dt-bindings: misc: qcom,fastrpc: allow FastRPC
 node without reg entry
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230327184811.499553-1-me@dylanvanassche.be>
 <20230327184811.499553-3-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327184811.499553-3-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/03/2023 20:48, Dylan Van Assche wrote:
> FastRPC nodes may exist without a registry property and actual

Why would they exist without unit address?

> Compute Banks  in some cases such as the SLPI on the Qualcomm SDM845 SoC.

I do not see there anything disallowing unit address yet...


> Relax the regex to allow such FastRPC nodes and remove 'reg' as a
> required property.

No, at least not without proper explanation why unit address is not
allowed for these.


Best regards,
Krzysztof

