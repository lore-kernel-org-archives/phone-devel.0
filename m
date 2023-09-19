Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD735CD5BB2
	for <phone-devel@archiver.kernel.org>; Tue, 19 Sep 2023 12:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjISMxi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 08:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjISMxh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 08:53:37 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88677F7
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:53:31 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so4934599a12.0
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695128010; x=1695732810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INMiqvUlAaZCTtMIDQyk+1WY/3AkEXIA5CE7CWai5GY=;
        b=eB16tIJ+fvP327Sx/4tHcAGR3hUEbzNPpQSN1nc1TgSq8lhBI+2hzGtq2iUNTMscYR
         8bCirKD+EuY6ZEIHmGsJRgXRaMnCDR+EgKJine3PUox/jyGppgrSLq5aD5zoW4ok367E
         FHIKMyNvrpiqxN8X4BzWn6UmY58GEj+PomQycdfuYuh3ZDZjgQtZBC8I51Hp2yiNMSiu
         IK/kx2cNKwAAy5n/a2oX1SF95oWEWB3Q4XgC3YzJZiyfYZLNpE4g8+xG1qL4mn5wVoaX
         lEMdN8IWgPUXtjQfd3sB0Ki7Oq07N5fPCWs52Wq4YpzWew8fJaBoIdzSbGQPESmcnbg1
         0BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695128010; x=1695732810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INMiqvUlAaZCTtMIDQyk+1WY/3AkEXIA5CE7CWai5GY=;
        b=j1gHevHjKe45TBtJdQz+b13sP/Ah/fdvwz7Rd26k2D1qihKCHQrZbivG+X0f6B3Bq1
         4EAF6c5B07cNcTJdqDNiPoNFhjRrDcEH8H7vN1VXrHpVbpUoA5l96Mkte+EHyx+ughLT
         4ogECi3LEqRtPjXaE/LJF18Yeot1baY1zrsAwVeVCdsCZ/Db9BNqj6RYtA/81+j+Eolx
         /aR5GWKQQJ7Mc2roEaO/89RuQ+/rvgTFxjZ8JXkCdsD/yyq5NLsi4FmWVDt9aca/Fq4v
         dQl3b8JEHi/2I0ZZPYeRJon/awkkV8yhuA8z3A01/+fxMQkQJUiAgkXOv1YBZy9SMXxl
         CrtA==
X-Gm-Message-State: AOJu0Yz5os9O55e87OtLrhCbUJiHO5zwT87uQaITNCYwct0YPazI1MUx
        SHie5F5Vs8VL/MHf4WeczDoasw==
X-Google-Smtp-Source: AGHT+IEINsXjXfjtGzWqPWa+cEhOBEeN7XWe+mgsvs5pSD3THfNwQV0yJfhtEdE7wg3yI8rjnjm9FA==
X-Received: by 2002:a17:906:30cf:b0:993:eee4:e704 with SMTP id b15-20020a17090630cf00b00993eee4e704mr3329317ejb.38.1695128009898;
        Tue, 19 Sep 2023 05:53:29 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm7779902ejy.3.2023.09.19.05.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 05:53:29 -0700 (PDT)
Message-ID: <d66480b2-818d-a993-021d-1cc0f9c7d9ab@linaro.org>
Date:   Tue, 19 Sep 2023 14:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 6/7] dt-bindings: arm: qcom: Add QCM6490 Fairphone 5
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
 <20230919-fp5-initial-v2-6-14bb7cedadf5@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230919-fp5-initial-v2-6-14bb7cedadf5@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 19/09/2023 14:46, Luca Weiss wrote:
> Fairphone 5 is a smartphone based on the QCM6490 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

