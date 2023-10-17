Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070F9CDB474
	for <phone-devel@archiver.kernel.org>; Tue, 17 Oct 2023 16:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbjJQQZ3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 17 Oct 2023 12:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjJQQZ2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 17 Oct 2023 12:25:28 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC490A4
        for <phone-devel@vger.kernel.org>; Tue, 17 Oct 2023 09:25:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so61075621fa.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Oct 2023 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697559925; x=1698164725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2vb1XTNsfZ5m/BsQX9yIiGSsnUXjkotdRfEp1ocJIc=;
        b=cR5IqRLhXGkfi0FuhyZRet7dGDLQ7a8XepbPVmgGmacw3y7tSzzNX4u1aUwZqphsWM
         aj0ZizpigWJ0XelbmCRrxxX8kOoRBu5EORw8XXx7pRgUHNh7xXNtUAas+slDtiUGNebJ
         SZB7GlxUfJm3GBNNuKY5zCMc/tM6EIU7YZMwl5+fssdInoUdrhiS8iPVwhlaSGD8AoRB
         dB5yk8D3BKnegugzujD0V1k1LI9ntR0hE/Ky6svY1R58SVRrpwSmnUF3zI6I/bII70rg
         nP3E7cfLhk4EHFjVCOFXJ4RSKQVxsYjkV94dvyuM7MPeDt30Qis4DsnbJQoagnQWNUmL
         rxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559925; x=1698164725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2vb1XTNsfZ5m/BsQX9yIiGSsnUXjkotdRfEp1ocJIc=;
        b=gVUnNr0259wplH7Us/WFmoGh35jsta0qqLrD50Po2x8aY1ydN71AIkXQG0D2goNj8z
         TWsW5ZfKzP399nSLLaDZO97d0SyRFoMdQ+UPpVBlYa9iy8oLURyeYOKLrSl4aWxzSN3M
         vuXbqjGyPhMyW5SNK691yQsfBfMfZWjmygNcXQ+u+5piGc9VfsohKKtEcch/dJ2y2k2V
         te3X0L+TC5SFTZgO3qxy7vDbTNVco7KmclyySjGwTGO2rkexd2JOslD24GgHWgEcaC4t
         KJroSST+OL33DEikGHNTeBNwXxh/E6HtqxkEOrewvvUX7S5IrQdwilUdmsxMS7YnILhe
         2Txg==
X-Gm-Message-State: AOJu0YxFUOoW85yMWchhPa04EfDtQxPMds2Rdm/qaxgAkZVPyhqNaBsv
        01jwVJNzYCU+EioaR0HBaR9TXg==
X-Google-Smtp-Source: AGHT+IHWYI3YdD4u17EV22k+TxJ8a4G31u0Rd7E+oANUptnfVtuZcNmNr3WukHh7GNrQrXXXJplpWg==
X-Received: by 2002:a2e:9bce:0:b0:2c5:1f57:1ef5 with SMTP id w14-20020a2e9bce000000b002c51f571ef5mr2280248ljj.39.1697559924923;
        Tue, 17 Oct 2023 09:25:24 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b0040772934b12sm10459334wmq.7.2023.10.17.09.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:25:24 -0700 (PDT)
Message-ID: <3aede886-3219-4b9f-a44d-0c414979c260@linaro.org>
Date:   Tue, 17 Oct 2023 18:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-longcheer-l9100: Add
 proximity-near-level
Content-Language: en-US
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20231016-bqm5_prox-v1-1-2acdc732be9d@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231016-bqm5_prox-v1-1-2acdc732be9d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/16/23 22:18, André Apitzsch wrote:
> Consider an object near to the sensor when their distance is about 4 cm
> or below.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Out of interest, what is it set to by default?

Konrad
