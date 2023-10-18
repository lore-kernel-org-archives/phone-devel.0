Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C2ECDB47E
	for <phone-devel@archiver.kernel.org>; Wed, 18 Oct 2023 08:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjJRIuO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 18 Oct 2023 04:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjJRIuM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 18 Oct 2023 04:50:12 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE47F9
        for <phone-devel@vger.kernel.org>; Wed, 18 Oct 2023 01:50:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5079fa1bbf8so6148116e87.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Oct 2023 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619008; x=1698223808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VY8V074ZaWHR3uxPsaqqpbxmTtftcDfFzH7Dssm9LII=;
        b=p5f7KhhSc7cBaTlx5VdOHiZxPxaZbsYhD5lw4ZBavMdgIgM/Vb6zaSFd6hl3orzys3
         p9qKMeHQFkcQF4RrD7+t27oYC3f9U5jSzRAv3bIpWcITG/8D74GyWOREX3yGcmZXiO7b
         a8Nb7uIgIgNJKTkHrz6P9Z9VLntIh4Vj72C5RC5IsCHfTiKdBPIhtlIW5l3d3triwBfI
         RodFmm7ucL6GIWiY8wmtTPr07rhHDXOnvSoGj1aR9THKp8Of8ZTYwjHFcF3Q/r+CKmvL
         aO7VFWJSJB3vzAZfi66DdWSTJukO9UziAZTuSyR5oFTV3MOtko17/iWfEXB61KosHiK7
         Eouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619008; x=1698223808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VY8V074ZaWHR3uxPsaqqpbxmTtftcDfFzH7Dssm9LII=;
        b=JUfiflCpM9nw8jPUQKlf6CRD38VHcaC9mm8ZEg+YDPZiuFtL1P703+f8FHL5xaPc9K
         6jTvjnytW+0B8m0IhKstP/fnyXkm3vl1Y/w0lI38Plf63+cVfYzg+kMlA8oz7fBU04YB
         Jlek+R7+j/KPPUDWK//MxrtZkOirxisZWQPv2dsZbyGonkVQebXhMQe5WBqE4KqycMZP
         i6kcsUal7HBMsI/GeX4YTciuPISyrSoyQD1jQ7haLc+z3wMlcApKTaMAZc/5qY4/1um6
         YUVaHC9JOn08ESAzjHzyrGOZOY3cJ1Ila7zhoUiWLfozDfhIvKM8r3QUaWnwrrnULmur
         FhNQ==
X-Gm-Message-State: AOJu0Ywu0NuRvR/L8kHaC5jbluvKwiWsnPHt18nQriGbmTTdsK7UrWDG
        9UG1cI9HeA5NlDhr2bGl1/f2LA==
X-Google-Smtp-Source: AGHT+IF5XWZCdhFd+sdr7SW9sr+WDumaME1Zk8oICpesr0u85VtPi3laTpJVUkx0QZ0bIQz0st1WIg==
X-Received: by 2002:ac2:5586:0:b0:500:95f7:c416 with SMTP id v6-20020ac25586000000b0050095f7c416mr2891199lfg.7.1697619008563;
        Wed, 18 Oct 2023 01:50:08 -0700 (PDT)
Received: from [172.30.204.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a056512079400b00507a3b8b007sm615700lfr.110.2023.10.18.01.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 01:50:08 -0700 (PDT)
Message-ID: <6b4c544b-5325-42cc-9479-bd4db7250687@linaro.org>
Date:   Wed, 18 Oct 2023 10:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8916-longcheer-l8910: Enable RGB
 LED
Content-Language: en-US
To:     =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
References: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
 <20231013-bq_leds-v1-1-cc374369fc56@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013-bq_leds-v1-1-cc374369fc56@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/13/23 22:51, André Apitzsch wrote:
> l8910 uses KTD2026 LED driver. Add it to the device tree.
> 
> Tested-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
