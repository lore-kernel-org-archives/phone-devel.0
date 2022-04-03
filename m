Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF864C433EF
	for <phone-devel@archiver.kernel.org>; Sun,  3 Apr 2022 19:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376392AbiDCTnL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 3 Apr 2022 15:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376382AbiDCTnK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 3 Apr 2022 15:43:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ECC3917D
        for <phone-devel@vger.kernel.org>; Sun,  3 Apr 2022 12:41:16 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h7so13668325lfl.2
        for <phone-devel@vger.kernel.org>; Sun, 03 Apr 2022 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oxxr7bPrjDPeIv+VJE5lRRshNToYGMZqrjQO687UQao=;
        b=cUeCCbNktrqD8Qdg/Ie+X2m0MNc0hrNxfmuXM2wBiFDHhl46u9/mKs8HR7T4wCkWvc
         +ubhIMyDFcicqREcmOZlIcNhCR6lFM4ul0rlS497aeH+wqn56IkC330+goC/As/9Jp3A
         kVycyL5ri3MQnboWNN9Ppe6cRZmXM+Ywa65PzE/fN/E9XYhUXXDzzfRQ6i/rV/qC2oN/
         eHPXDHkgDgrZxPF6dXl/KDSawSzdsaMk/pw6dzNyiN9jI4cyM6aJkaosrkQTFdGP1A+h
         duR/pbwcxi1sJ4rUrXmS+55XNxUa31J9skrVOYM7Kh4JUxVuVWd8jkI41fCst0ra/Ao6
         tBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oxxr7bPrjDPeIv+VJE5lRRshNToYGMZqrjQO687UQao=;
        b=ELConCNJsZH2uaxoVXG2gs4/jEct1sOD8QxN4YGzLEiBFt6S+CNJuh7CnzbQh2tKiL
         N5xqKiIPBJr54ZTHX5NBeMkGwk3vbdwxu1WOTUaaaYONJqNoh+M6KzlYSW5NCD7GeSXk
         RduYsdx3MnQaaB0Tb2RS4M9VwJ8PgRHI+sNpSKAHxWxTnhz2C0E2SYIC7Fn395/8ht1a
         sqsjEqJuYkEAXU7pADQ70HFgIrm/L3UWMe05xCQzE/uUq0Ay+NqVy0+fBlkdyUM+Hrdx
         tgGL/gRDdv7rLc/Gq8jlblDB67d/ST3s/7q7kKDE7yYUsML0oYb+r7qWaE7KNHKMjxzk
         31iQ==
X-Gm-Message-State: AOAM53005Ea35WOTWoMFoqh+fuRSY/iPDQbxmid48B7f7Qmj/H/OczfZ
        s+XjWF/Vj/S8Arxb59MzcKBVxA==
X-Google-Smtp-Source: ABdhPJyOvbhXo/NIFiPA1rBXSDpVn2irDyvsKus+NU3HIiTdO2BhuimM4/7nodeyg61Y+BeI1rdZdQ==
X-Received: by 2002:ac2:4e03:0:b0:44a:c82:35e7 with SMTP id e3-20020ac24e03000000b0044a0c8235e7mr20676685lfr.10.1649014874172;
        Sun, 03 Apr 2022 12:41:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y12-20020a2eb00c000000b00249b0547be5sm861093ljk.99.2022.04.03.12.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 12:41:13 -0700 (PDT)
Message-ID: <70d8f9a5-9360-77c9-c844-3c9c10fdf43d@linaro.org>
Date:   Sun, 3 Apr 2022 22:41:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: msm8996: Add MSS and SLPI
Content-Language: en-GB
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
 <20210926190555.278589-5-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210926190555.278589-5-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/09/2021 22:06, Yassine Oudjana wrote:
> Add nodes for the MSS and SLPI remoteprocs.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #db820c


-- 
With best wishes
Dmitry
