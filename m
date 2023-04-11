Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9686C77B6F
	for <phone-devel@archiver.kernel.org>; Tue, 11 Apr 2023 06:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjDKGI2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 11 Apr 2023 02:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjDKGI1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 11 Apr 2023 02:08:27 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8A31B6
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 23:08:25 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id jg21so17204081ejc.2
        for <phone-devel@vger.kernel.org>; Mon, 10 Apr 2023 23:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681193304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7LX/86biFeuZ67y+mdjDqHPfY/k7PmtqCZCBZyXkP4=;
        b=EpPkoOUiBYyrFvk5M9L4sWXQr/haccxnxqbhUGSe6NzQfsvTWoEjMjEvig2r9XGd4d
         N3zFl8qWuo2a95Onoqvz436Z58A8hO8nMI/c6XpbWDLeDw5irsFDcsigeMvVhDJkjd3J
         RwzbFCT4rbwhQozijl8mEHzOelsgNw5jKxCDWI8VoAzDRx2AtGIV7GDDaSicflo4Ig3C
         vizu2SkXppErKkofE/Uib7bJynGLv9lL30DvLzyxaXkaHqKR5m9DblEovc62O/adAwm5
         HeJeZ6hK+lnuULvECJgS4UH9MlCvjHGj+GZ0pkoB9TfdNxN+LmitNxOEKEv680w3gcwO
         dmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681193304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7LX/86biFeuZ67y+mdjDqHPfY/k7PmtqCZCBZyXkP4=;
        b=JipmUmm7Q8JuhwiLedl60nJGanZN3CAEafEew/p+DcWxO/tcxIr2Zt4iupl1NwgKIb
         Wb+CHA1HF2HnjyL3yysSEjv71V+F5TTrgFjPHK7n/lkz55NbS0fTpY/hwEkPcE0IQzxd
         mr8c044BV8o1Kom3Bt3bezDFMWtJ6Ikjknj4urZmyazSHnUXQMP01w7k2BpRS5G+jZnv
         enf3yddiFT9OyWGjbLpiZg3UGSsr+JmGF+gFwIBJ9Hqa6Y2J03cAqiJO7JHbA5jl6UUs
         TzZMp5y9GQZC4vTUaEL1Ibk7WH2MonjlgSSqMv70WVbSntVECWpCZ8fhxUv0ymB+OP0M
         q49w==
X-Gm-Message-State: AAQBX9flD1KYvU/6UxONReDRQ5L1haoLC4G+xBSc2HIBxa4W+yKkeBdn
        eu3hB+/RgLnDwZyeG/oeKg3hzA==
X-Google-Smtp-Source: AKy350bDR9ld1RyHS4rvrZY101w3YSgLDpFWb+Z/8w7wrQ2vThed+0dViCJMdG2YCJaOnDgpVEGhTA==
X-Received: by 2002:a17:906:f992:b0:934:2fe4:4921 with SMTP id li18-20020a170906f99200b009342fe44921mr1343036ejb.19.1681193304179;
        Mon, 10 Apr 2023 23:08:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id kn3-20020a1709079b0300b008cecb8f374asm5735259ejc.0.2023.04.10.23.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 23:08:23 -0700 (PDT)
Message-ID: <6e22615c-d9ab-358b-efa5-708c4362d8d0@linaro.org>
Date:   Tue, 11 Apr 2023 08:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 3/5] dt-bindings: thermal: Use generic ADC node name in
 examples
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-pm@vger.kernel.org
References: <20230410202917.247666-1-marijn.suijten@somainline.org>
 <20230410202917.247666-4-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410202917.247666-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 10/04/2023 22:29, Marijn Suijten wrote:
> Update the examples to reflect a future requirement for the generic
> `channel` node name on ADC channel nodes, while conveying the board name
> of the channel in a label instead.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

