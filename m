Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3FBECAAD3
	for <phone-devel@archiver.kernel.org>; Sun,  4 Sep 2022 19:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbiIDTOr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 4 Sep 2022 15:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234419AbiIDTOq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 4 Sep 2022 15:14:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968AC13E87
        for <phone-devel@vger.kernel.org>; Sun,  4 Sep 2022 12:14:44 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id p16so10417787lfd.6
        for <phone-devel@vger.kernel.org>; Sun, 04 Sep 2022 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3GXh/ns1cJ/0c/GapXMPVA54+Xh4yfj4dl+7YFfWaUY=;
        b=wkk+uEcKDPx2YAmk7uSmpiP0cgoeu8Wq1z7ZeGpxUFA5yFBN22EgebzlDhFopcYLOj
         1cJV6h/SrBlvUo5g2hEMsQp2f3E8Fy3u1IKNiVNHx0gntkdlmJD8AmpZqwSYfmIkQZeQ
         HwgQLVlTap+yROtvfOo03sHgJVqnY0K5MbXkFEc3twCJXVWWBhqNGWVseli7gBHPGh1d
         +v17mkHqE5wBDmcIpl84E9AeQZ/sTw0VptttUOBPRI9NT8nz+HPtaSVaScfu3IlQZCRt
         FjizDrvAryJQ6Wd3yy4XkYd96uEBaZ/eyKamnEkKzCYK0aK6LtUiU8pomCHY5pmL/9oW
         wr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3GXh/ns1cJ/0c/GapXMPVA54+Xh4yfj4dl+7YFfWaUY=;
        b=SRMtIOZuZBxw3eMBl8S4yAlEO5sNnFU3tkwL0OyBPqYkCufJsmdRz8eOEyWJvP01dB
         2/ypvyB3ERg02d4gMnml16TUWy2lJkbpM6Zf0HuoAx3D+4t85kw89U+a3KKjCWUmxAWD
         6dx0EiEFLt3x7PUsw8lwuXpYsjmMAjGi4AcAbvtaZRIEgmwA4DpZs3Pu/mkaqgBJLDZk
         8tTAvAC1oNQa9tdKQEt4KhP5saNi6RiyZejuWV1GGLjVbxkzZdGRwrKbp9Pfahj26Okr
         U9WUoh4C8XVhRGim9IZgfjcHzsLO5qa44Q8pXb6Bqh6nDNXO0DGsOEmXo2E/Y2BSU+oX
         cwvA==
X-Gm-Message-State: ACgBeo0NnCxY7LGvZln03eZB/XeTvd0u3oiJMxEXG4+REl7Egw1u5j0H
        4rr196NdUmbIn7P7ThL5GzS9Kw==
X-Google-Smtp-Source: AA6agR65rv4fXBrevKCCM1P0Gy2/g/+9ZK4R6CXmOMuFjn+F7xVJkIQ1wisP9+dZws3s8X+HDpKvrg==
X-Received: by 2002:a05:6512:1149:b0:494:9b4f:75e5 with SMTP id m9-20020a056512114900b004949b4f75e5mr6148774lfg.236.1662318883009;
        Sun, 04 Sep 2022 12:14:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t16-20020a056512209000b0048aef1abb08sm987827lfr.297.2022.09.04.12.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 12:14:42 -0700 (PDT)
Message-ID: <423bc933-2049-5bf8-b0ca-7e1ddc1f5852@linaro.org>
Date:   Sun, 4 Sep 2022 22:14:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/9] dt-bindings: firmware: document Qualcomm SM6115
 SCM
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-kernel@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-3-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220903174150.3566935-3-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/09/2022 20:41, Iskren Chernev wrote:
> Document the compatible for Qualcomm  SM6115 SCM.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

There was such patch:
https://lore.kernel.org/all/338f2929-aa67-bf63-2d66-5de48f6af1c4@linaro.org/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
