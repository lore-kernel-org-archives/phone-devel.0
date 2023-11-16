Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09825C197A0
	for <phone-devel@archiver.kernel.org>; Thu, 16 Nov 2023 15:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345367AbjKPPSB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 16 Nov 2023 10:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345330AbjKPPSA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 16 Nov 2023 10:18:00 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FE819B
        for <phone-devel@vger.kernel.org>; Thu, 16 Nov 2023 07:17:54 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50a938dda08so1317452e87.3
        for <phone-devel@vger.kernel.org>; Thu, 16 Nov 2023 07:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700147873; x=1700752673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c86qO4XwJ1JxYo95YcC/cJ889pUl6EruyihJzXoM0Hw=;
        b=t9h81Cn6XW8J0eKo2E9Narw0Plr0+RWdXP7GgJllmWOTF4R1Bz+1n5Vh1Yi4mKPcbq
         iER3z0D3oV+FdZsDiGRbU2x48hKKx2q8nKBELfz6sJF9AdIK6awBEifJc5aD15zZ1893
         NA4TsrQwEiyVOecMh9tfJ4U6PUbQ0ss+0ZIX1l22fntv9p2b3BYq0/MO3p5Iz4JWCHWN
         Yq4c0RPc7JiJLiUi+OFXumoemCjg2C319hSAKjtXu7J5Nqa2S4+uRFwp2PJmDfLKhOeF
         0pGb+yu0LF/t/D0ZB5TTrcu1L4Cmb6X9NWcI4yj6XiU31niQihkZYEaRTkNM29RTjF4J
         gCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147873; x=1700752673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c86qO4XwJ1JxYo95YcC/cJ889pUl6EruyihJzXoM0Hw=;
        b=DaJsFfLPEVHo2sIhyo6jSGb+7CihKZDvj/dX0AO4xbuFQkRdLDmljMOQx2Frr5LJpN
         WOTjfZ+jWmvqSJALAXsiUXLvw+3W/3DKspVkdV2R8QUxr1gJCQVkvEtVWHNqY9ugWLkV
         ShipS2yksUu8vwWzaW9u1PyfaHpkmY/JoNE+Epy8VFGmOA1fbhWmy9TDpbCYf3Eq+qYx
         X52/c0C74KyiEs2WG7X4XtwMUzXMSTV0dfJtMo3tuUEvLzv3eYpolTHfV4OlyspmTsXT
         40BqPudNDm80dACTnFuuNUU86KQboq8sriT3h0c+S6y5+Fur47TQACIcF87Jn6sognUc
         23Cg==
X-Gm-Message-State: AOJu0YymfalWELcRc+zPtNeNXCpG1zJMseRGNS+hYzgZNwP9LkL6A8nl
        32AZtXuCkPlOIPBvLf4yzJiAaQ==
X-Google-Smtp-Source: AGHT+IGCynGKBV2xfjm3/F22zFoI2s5tPIReaIcXe1jrsp/JQdWKJTZfqSlwxIOf0g1DRrLOUyhTtA==
X-Received: by 2002:a05:6512:60d:b0:507:f0f2:57b1 with SMTP id b13-20020a056512060d00b00507f0f257b1mr10401985lfe.15.1700147873129;
        Thu, 16 Nov 2023 07:17:53 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y22-20020a199156000000b00507f1c8040fsm24856lfj.58.2023.11.16.07.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 07:17:52 -0800 (PST)
Message-ID: <8f13d5d7-a8fa-49ea-bd34-4bbe89261faf@linaro.org>
Date:   Thu, 16 Nov 2023 16:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: sm8350: Fix remoteproc interrupt
 type
Content-Language: en-US
To:     Nia Espera <nespera@igalia.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob <Me@orbit.sh>, Clayton Craft <clayton@igalia.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231111-nia-sm8350-for-upstream-v4-0-3a638b02eea5@igalia.com>
 <20231111-nia-sm8350-for-upstream-v4-4-3a638b02eea5@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231111-nia-sm8350-for-upstream-v4-4-3a638b02eea5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 11/11/23 23:07, Nia Espera wrote:
> In a similar vein to
> https://lore.kernel.org/lkml/20220530080842.37024-3-manivannan.sadhasivam@linaro.org/,
> the remote processors on sm8350 fail to initialize with the 'correct'
> (i.e., specified in downstream) IRQ type. Change this to EDGE_RISING.
> 
> Signed-off-by: Nia Espera <nespera@igalia.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
