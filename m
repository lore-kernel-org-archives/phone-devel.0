Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E11C433FE
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 13:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJMNlU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJMNlS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 09:41:18 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901FD5A159
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 06:41:16 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id jr1so1081117qtb.0
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfmEgQuQVh7sTBmqJ0VUPOWywieYxc2ZYWNI1q6xxkM=;
        b=m7VC4poWRxJmtaAHaMM31ThEfzElZ6O9xDTexyesxF9+tAuMlB9okvMdWIQIbpZRab
         lfyXIBDjGQ7PEMRwGd8V+ORRJRIdpxfrkJF2rGEUmGSVNzqVEVnE49Q76NktnfSB2od1
         cs080AfipvWFO3fPZIEDii/reoH7m0zVr2xUSiF4wGG6TZ5EDkHXgUZpfFctSHHtWGul
         0bJWyUWuaBOfOTWZ6NA4IQfMQ6VY0evvj74Y3FVtck+5iyXNHxqDOV17upBHCFj/XQlL
         Fig5CCf49g0Lgeu2pqIjr/HQkc73LkKuQO1pOJ2a7BN5Ndi/TyZn8+MdhSqZbupHPKn7
         fhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfmEgQuQVh7sTBmqJ0VUPOWywieYxc2ZYWNI1q6xxkM=;
        b=w9HRR4WsYoaAH7rPzqzOxl2aOzN4NUCZctHQDFQ0PqUWKe3cOMAQihTsdc9SwHWPhP
         kGaxaDecLNaa/BD42n8b33L3EMc2aYSZokTZsJL0brbAiVlrvOaRQzuqPkvq/ppfVrLz
         239xE1h/52I0kGqfVeaM2xE/bcDGFBB3wdsNxbA+YCDr/kZo8J1KXQbsB/obdWFys88O
         UTNMQhGwTcCIy+UV66aonwqk+YHAHdv75j2w1JcSegenIT1UDdj7xY2nSRJTX6AObvyH
         Y31JnGmT0BsSQ5RMyL05Mrd6k0Alc5wlBfKcUYDsL0maYcn8muiOch/pbodLDXrAn1wa
         WkPQ==
X-Gm-Message-State: ACrzQf0v/pOiwOXQYINO8zYKQ5pqU6VQ49vMVyYv7P+Y4G4ZKLBKq1nR
        JWK+O+wRxddNUvYtBGpRik9L+Q==
X-Google-Smtp-Source: AMsMyM6Yeebymip42Gn94hyjo2aEpwIcg+DQ9YQgBwfVTw3CqEJJ95fFwLXiRpj2B1Xm48vHnDeqww==
X-Received: by 2002:ac8:5e11:0:b0:39c:b869:491f with SMTP id h17-20020ac85e11000000b0039cb869491fmr9642738qtx.315.1665668475630;
        Thu, 13 Oct 2022 06:41:15 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id o19-20020a05620a2a1300b006cddf59a600sm18876143qkp.34.2022.10.13.06.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:41:14 -0700 (PDT)
Message-ID: <861dd64f-0443-db69-ef81-900973f2fa11@linaro.org>
Date:   Thu, 13 Oct 2022 09:39:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] dt-bindings: qcom,pdc: Add missing compatibles
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221013091208.356739-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013091208.356739-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/10/2022 05:12, Luca Weiss wrote:
> Document the compatibles that are already in use in the upstream Linux
> kernel to resolve dtbs_check warnings.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

