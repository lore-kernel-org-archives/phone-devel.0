Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDDCCDB47E
	for <phone-devel@archiver.kernel.org>; Wed, 18 Oct 2023 08:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjJRIu1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 18 Oct 2023 04:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjJRIuZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 18 Oct 2023 04:50:25 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D91B109
        for <phone-devel@vger.kernel.org>; Wed, 18 Oct 2023 01:50:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507b18cf2e1so3786819e87.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Oct 2023 01:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697619021; x=1698223821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jYwjEIsDAOJ6QvGGA1UdoS9AIT92GPKHL+44Ytf60aA=;
        b=b71JvMbCUSTLCvAxnx38Bb/IuvTp4yurB4JJqiiZp8Gns6UjB3D/elG31bTeV1CLp1
         yq0Fd2wkALIB5Z6lhrXTmfuYsAAxmXurSVHTjfd3tgvQcrIuA8u2u/cBvxUOp9Duwhcg
         X5lmmmlwXCsVbdO34PXmDAk5qkh3s1PWNnuqQbyroZUgwBErkqYpQjle8+JG8NEAV2Ge
         5O4PhLSdtBk8oco1gzIppUsALJ8UXUzjluzAZDZHTn6PiYix/8vnI5ARM0o7+gwnPGfF
         zsj+CK+YsF9PkkSyOJgEh+sQsTmz2BAeu9Hm4AHtP8uuWp5TyQ3d3kvbPAZCd9Uk9R3f
         WOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619021; x=1698223821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYwjEIsDAOJ6QvGGA1UdoS9AIT92GPKHL+44Ytf60aA=;
        b=SMj8VK2AFahj/N+ebBMnPCdcgE87WXWH1ZmzvLyI+H+NcI3KBrUlkZhgHjiIW0BBMN
         qcTutu7Wv2aUoyHwhIuSxZSyWcCpRQXK1v9EazQLWlYSafafgjxQM2pAoFErS69xegR3
         3eRXT6M/RhOQQNXpz3/4ISQpj8BTFnMcO3jTI4QmWP2Qrn5Gk3Ik/DlfA1yzv8YFAAbz
         fqjs7j1aHXLtbXvkOcUSnUuFxGPVMfYU1AVsb+vA1pcM5iyHOovbVnyfy8xi/a4u7z0O
         +kiFxMBPWp2BnMAqJqEjOru3AnVr4sV/fEA5o/qJoBEGmw/EhOZY55XDpU76cCxGNTJX
         DjVg==
X-Gm-Message-State: AOJu0Yy0N3hHUVFNBrTKr8aW+WsvQ0JgsELY3I/I3xPqCwoi/YvbixJR
        GXMQR4KmY7KDX/FLvwpP1LYjaA==
X-Google-Smtp-Source: AGHT+IE47qfwBPgQ/N38nc97qlSrQIHT4r8GN6vl1gvPY38d1Es3r1wgdTuPxA8CDWKYgtog+6RYnw==
X-Received: by 2002:ac2:484c:0:b0:503:2dce:4544 with SMTP id 12-20020ac2484c000000b005032dce4544mr3457302lfy.59.1697619021490;
        Wed, 18 Oct 2023 01:50:21 -0700 (PDT)
Received: from [172.30.204.55] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a056512079400b00507a3b8b007sm615700lfr.110.2023.10.18.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 01:50:21 -0700 (PDT)
Message-ID: <0ef687f6-988f-47a5-b8df-b24bab462026@linaro.org>
Date:   Wed, 18 Oct 2023 10:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-longcheer-l9100: Enable RGB
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
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231013-bq_leds-v1-0-cc374369fc56@apitzsch.eu>
 <20231013-bq_leds-v1-2-cc374369fc56@apitzsch.eu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013-bq_leds-v1-2-cc374369fc56@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 10/13/23 22:51, André Apitzsch wrote:
> l9100 uses KTD2026 LED driver. Add it to the device tree.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
