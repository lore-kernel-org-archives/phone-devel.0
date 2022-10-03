Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED1BC433F5
	for <phone-devel@archiver.kernel.org>; Mon,  3 Oct 2022 07:49:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbiJCHta (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 3 Oct 2022 03:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbiJCHsA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 3 Oct 2022 03:48:00 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7402113DEB
        for <phone-devel@vger.kernel.org>; Mon,  3 Oct 2022 00:27:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 10so15342054lfy.5
        for <phone-devel@vger.kernel.org>; Mon, 03 Oct 2022 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VxLz+CiueyVvu++oqIB4n8YZjZ9RxrwPKFRwIt+z1C0=;
        b=Bs0SQnQj+Xmn6KqExiDiGgUwHoJqM5rizfJiThZTYtkBuatI9cF8KdjbC/uTfBVDhV
         fIA1COwBydG9dx4qJ+8euEOHJbDjeIwVGPVWwOmP0QiuRNC5Uf7EQnJWopN88mi1OA58
         zKKkNCLrNEFqVWfJDbvtDeOuN3zwVGc7kbY2C5SveLwkPqtsPl3IX/3Lh805tUSZ0aVe
         8/N6faHsqSRoEGmuKO8tpCj88KN2ObI1YWuKcEmzhXifhJkanwqEiVCb9QGEEt2Rukyu
         vBaJp/cQ0stxvSL/k6Deafe9/f617wYk3LqjdrQpedkvfztf6iXhAtQPYfuAoaME6EsV
         axdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VxLz+CiueyVvu++oqIB4n8YZjZ9RxrwPKFRwIt+z1C0=;
        b=FBhymyyHvfAeTT0CngTTOHF7Y35OzD5ryTajTn4oz41ValVBiIlNKMq6s4WC0zoXHX
         48svtPIPStQTbGj1idapbgR3JLVWBSq644N0jxfaRhQO5ktQOF2Oj7qUe/OMRp3DXJMx
         tUB/O1jtrfd0sJLRbYT0oYmfmL5Imp8fVhyTCMb5pfiGh1nd6v3KCTReDOnbDHfzfJ5X
         u3fuJf9QqMbWoT9QdeyBI5sbZX8uyB00FvpySWxsA4TnBmS5whXAFSkuHdLYCwkizRfq
         YoQURo3e8PF/51y4G6TZDaUUapCzarfWKr/yMTdjHhWV/+CFUeEKFOOtlKl/OeqtKkGb
         Tj4g==
X-Gm-Message-State: ACrzQf1DeZ2HRNdRfQVB5vCj4eYhOFmFgqvBprW0ZfputpXJzUm22gyA
        ZEbOqA+OgxUgZ0aNIgah5HixgA==
X-Google-Smtp-Source: AMsMyM6UWo9ttAvzfg/NKEz06mFrr3n9K8bvsb0F9lo6ILrx2L/rCxI21p/obR2+722kv1KXAzQ2oA==
X-Received: by 2002:ac2:5bcf:0:b0:4a2:4521:634 with SMTP id u15-20020ac25bcf000000b004a245210634mr648176lfn.201.1664781950664;
        Mon, 03 Oct 2022 00:25:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id cf31-20020a056512281f00b00497a3e11608sm1339726lfb.303.2022.10.03.00.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:25:50 -0700 (PDT)
Message-ID: <6c590add-c832-b29a-97a2-fd02efaf1727@linaro.org>
Date:   Mon, 3 Oct 2022 09:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 3/6] dt-bindings: i2c: qcom,i2c-cci: Document clocks
 for MSM8974
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
 <20221002122859.75525-4-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221002122859.75525-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/10/2022 14:28, Matti Lehtimäki wrote:
> Uses same clocks as MSM8226.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

