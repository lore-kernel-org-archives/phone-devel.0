Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0665C77B76
	for <phone-devel@archiver.kernel.org>; Mon, 17 Apr 2023 07:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjDQHmr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Apr 2023 03:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbjDQHmY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Apr 2023 03:42:24 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E6444A5
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:42:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id xi5so61665476ejb.13
        for <phone-devel@vger.kernel.org>; Mon, 17 Apr 2023 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681717323; x=1684309323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBiaQbvW+f05yQSrBNW13pqQ6G/hNkW2GoKFWQO/n/g=;
        b=BWVFVStz2TZHg3ZxnAeX58llS391Y5YW45v1H/Wj/za7UAMQ/U2EIg9xUXno1N2532
         yfeq2VllMs15/bAoNVsv1S/PHVYTwcrJYV+UH+1aYoeB+U/xLPs05Sw1XMEeFervVJXA
         iRPfEyPlI7rwiIa55iWwT01FY6LgCIWAwLosspyK0Th1wtIAA7bF0Axdi0DJbiMlfHAO
         jneq/k5nscQ+6V93Ylp/AMIndHitlfemaTUQATEpP1AipjzLYbTPY7TJyv56O9KJcQ3a
         CvXLsyD9coNZ1MQMger/50SwAOqZJFY4IQenSBhjDdgQwSpadymR9TFSq6j/cEUFGdhZ
         IlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681717323; x=1684309323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBiaQbvW+f05yQSrBNW13pqQ6G/hNkW2GoKFWQO/n/g=;
        b=QvNesJd+xxX47saP4NYtUjfI5ykeN3t4gpHl6+xblFCVQjk8FUjapru0V0ShYcPmcb
         Mx4X9k+u8ufMsn5JMTjMMnd3CrdICe4ysS5DWGnndwWzJ1LW3Hgk527LnHOBO74YxSHe
         PRQteBpE3qqwdVFdJEV59JahsJHtBvmxQW7pzrJ4K0Zp82YLRfsQzjpXqejojXRUby+y
         IBrsFMnAaZP0hQ0VGLqG28ejJeD416Z2D54dqH5xvsQhM955+mfz11DH3Ko/LYcEFnzQ
         KsAlt2Ub/ifzCHpIG8pvlj0aV7wihrxf9Ju7XhwTMw4es1ZmYJZLRz8HmUQm7bq/xKFG
         5s5g==
X-Gm-Message-State: AAQBX9dLO9hRqt/QdRn7S7l26X6o7mCGMZFVy3rqbBW0LrJAyn382Xzy
        nG1Jbsr8Ca06lvZxU63KqmobuQ==
X-Google-Smtp-Source: AKy350ZmsfvJTFbRNzbkxIlUN6HAa/DkrjY5d4PnMB+7i9O3ynFoVvsgVAHuco6uK74EiX+VYZRYSg==
X-Received: by 2002:a17:906:fc04:b0:94a:96c4:2361 with SMTP id ov4-20020a170906fc0400b0094a96c42361mr7411772ejb.73.1681717322537;
        Mon, 17 Apr 2023 00:42:02 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id hw10-20020a170907a0ca00b0094ebc041e20sm5548397ejc.46.2023.04.17.00.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:42:02 -0700 (PDT)
Message-ID: <faa533bc-e34c-a2f3-2d46-ed900e8d6be2@linaro.org>
Date:   Mon, 17 Apr 2023 09:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
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
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-pm@vger.kernel.org
References: <20230410202917.247666-1-marijn.suijten@somainline.org>
 <20230410202917.247666-4-marijn.suijten@somainline.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230410202917.247666-4-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

