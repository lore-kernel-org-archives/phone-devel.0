Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08F5C3F6B0
	for <phone-devel@archiver.kernel.org>; Tue,  2 Aug 2022 10:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbiHBKmf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Aug 2022 06:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbiHBKmd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 2 Aug 2022 06:42:33 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0D426108
        for <phone-devel@vger.kernel.org>; Tue,  2 Aug 2022 03:42:31 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z4so507423ljn.8
        for <phone-devel@vger.kernel.org>; Tue, 02 Aug 2022 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I4j/8n4xnT8IIxFREv8EVE5ht/FmQ3Sa2fVspmFHrgs=;
        b=WlWfECukTPGkP4Bkf536Lob1Xti44nFeJQjqpE4Ra2PHlWsA6+9LCnxwCEImuYQ09U
         0004WLCS0bUFC3XMyks0LVW3xvNRtetWnd5sKlpzPTCP0jxPY6b8fFMVRAr9NSgICmrH
         DokgE4XNobt2R1S/z9slyF6ojO5wcJmAuvHqWBne+XAgbcSb2IP3awPAMS40Zh06djlS
         T3q28yqrIiFNnIjW+QWrb5a9JjYVmJloPUohQdplE2hUGOS1r/ezFnaK3FvMF5evL1sE
         J6bp03bMQ+zZcIVS1JviG6nkowMlpD4cCB6XPGl2/migNk3W7FthP83YfTE12yj8EBMC
         pcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I4j/8n4xnT8IIxFREv8EVE5ht/FmQ3Sa2fVspmFHrgs=;
        b=jGGoOVl+W5eB6xoVhIdI9fB4FdXWVZBjH8YlVU53PEUpmL+lhiOIABTKS+ihRiScR/
         1nuPdLJ+isQDJso+VobuyLF9u4nw514SAqdyLNxZkZdNbebwD/Qnv1oQKPNE9DqaFBDB
         hVO9HRu9UQewdxbvKD2AoSNni1S3qsHZWBYJdVuXv3SVs8brFWJFFaIhaBOeGr87zUYW
         16rV+HFNoocLbeeFWZsjnr9XytVgHMbqd+8S5Je8jni3MObbYyAb803aLiPpnKax0VdZ
         /WYWxaF2YhkUt4FiSuRZxZAu20+MLW9ojUDAflgy34+15/xhjpXCOZW0CAgpcg+isJ81
         WhFA==
X-Gm-Message-State: AJIora/CZHR+9tWXuWT2l3YQG4mYTFsrd4oCvTHL7oWS6sqwrA+bW8e7
        v0f/fKQHCOZ0Hvxxuphm6tuCww==
X-Google-Smtp-Source: AGRyM1tzC68/tPz+QIxfLHnHPTZ4HN90ljcN5ErjCmRvTBEbuCD6n5ITyMIxxRm/Lk+IHzPxVafLDw==
X-Received: by 2002:a05:651c:158c:b0:250:a23d:2701 with SMTP id h12-20020a05651c158c00b00250a23d2701mr6867654ljq.475.1659436949946;
        Tue, 02 Aug 2022 03:42:29 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c12-20020a056512074c00b0048af3c315efsm997083lfs.191.2022.08.02.03.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:42:29 -0700 (PDT)
Message-ID: <f693f007-70dc-a4ce-e586-a9d97c6f361c@linaro.org>
Date:   Tue, 2 Aug 2022 12:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 04/13] dt-bindings: regulator: qcom_smd: Document
 PM6125 PMIC
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Adam Skladowski <a39.skl@gmail.com>
References: <20220731223736.1036286-1-iskren.chernev@gmail.com>
 <20220731223736.1036286-5-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220731223736.1036286-5-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/08/2022 00:37, Iskren Chernev wrote:
> Document the pm6125 compatible string and available regulators in the QCom
> SMD RPM regulator documentation.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
