Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C9BCDB465
	for <phone-devel@archiver.kernel.org>; Mon, 16 Oct 2023 13:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbjJPNxs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Oct 2023 09:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjJPNxs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Oct 2023 09:53:48 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F1AEB
        for <phone-devel@vger.kernel.org>; Mon, 16 Oct 2023 06:53:46 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso3418050a12.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Oct 2023 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697464425; x=1698069225; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOvRSIBCKDO/EoG06SNXpskpBSv5uHfI6z7Qbijhh84=;
        b=ZGfXHDIEVPsrSdi6s+cmpqGpouYUKTMnHCS0XjgyskuNwWucIDjhMF7sJdA650u0aF
         F6LffFSACGmJSI0ChVpnRRmsvDqaSedds+h4Pq2bhnEXceocq6j1uKfCv5VZk5GxK8LQ
         QGlBpWwk0qLq3vPnL4ILlwUdvrCcYNkzABzYzs1HEiKVKwYFehlXmDnkLhGVla1K6qq/
         5Dpoa8QwjjfdotnmCzsEhOl7rplTtfTMuEPnT6YtISlME/pEkSdm5bxTXeoB7YeiOgHN
         TGDg77JFPEL7UTIhgBoRUTcVz+P0KCmntScaYclCQVXVL3ZqPWrlU5GndpHBd/CXgr9e
         Hq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697464425; x=1698069225;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOvRSIBCKDO/EoG06SNXpskpBSv5uHfI6z7Qbijhh84=;
        b=bFg//cekj3N7rqdTlDCeulNO/U12n/pEMVLKyFkav4RfcZSSKE2tKHauplZiLl3rwA
         tmc3rqjXtP5RRR3MOUSiRlJjW6kbdijld3b2Afj7IS+ASrczp+OYRq8VHd1DVUY9WQ6f
         OHU6fTmsvuv33jeMyeDO9oiF26Q3dxn1mJySzJ+l10RRz3JkS5Yl0RSJog9zfA+GaXM8
         uuu0Rbs2u6uud7mY4y1wpAptyVjVoG5igaRzKTeP3Po2KITVVO4gmzB0FQZLyaJqWAc7
         SfSnU0/+sakL8obx/GfRBrr01UHiVE+fuo0k2z94Yi6nANuKD+DtVaE/EXDyL7LDVWB7
         IoMQ==
X-Gm-Message-State: AOJu0YzCu4iOQnqiblIOVceXaTNyJWo4qTKv5wfQ8ZXluvrl8F/ySwss
        DnyFTSazQFymwCZheeb3XQYfMQ==
X-Google-Smtp-Source: AGHT+IHoxPW8PwdZUvfviYS7QdbDikx9yohEhHLS/XOTq3T9uH87ZFiSCdLJimiupbVDzkcfzqrchA==
X-Received: by 2002:aa7:c549:0:b0:525:6e47:10f6 with SMTP id s9-20020aa7c549000000b005256e4710f6mr29895269edr.22.1697464424717;
        Mon, 16 Oct 2023 06:53:44 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b0053e9352643csm3015296edb.62.2023.10.16.06.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 06:53:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 16 Oct 2023 15:53:42 +0200
Message-Id: <CW9WX2BFW95K.2PHV8UU363BFE@fairphone.com>
Cc:     <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
        "Rob" <Me@orbit.sh>, "Clayton Craft" <clayton@igalia.com>,
        <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 1/5] iio: adc: add smb139x bindings
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Nia Espera" <nespera@igalia.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Jonathan Cameron" <jic23@kernel.org>,
        "Lars-Peter Clausen" <lars@metafoo.de>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Kees Cook" <keescook@chromium.org>,
        "Tony Luck" <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
X-Mailer: aerc 0.15.2
References: <20231016-nia-sm8350-for-upstream-v1-0-bb557a0af2e9@igalia.com>
 <20231016-nia-sm8350-for-upstream-v1-1-bb557a0af2e9@igalia.com>
In-Reply-To: <20231016-nia-sm8350-for-upstream-v1-1-bb557a0af2e9@igalia.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon Oct 16, 2023 at 2:47 PM CEST, Nia Espera wrote:
> Bindings for a charger controller chip found on sm8350
>
> Signed-off-by: Nia Espera <nespera@igalia.com>
> ---
>  include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h b/include/d=
t-bindings/iio/qcom,spmi-adc7-smb139x.h
> new file mode 100644
> index 000000000000..fe163cd8bbdd
> --- /dev/null
> +++ b/include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_SMB139X_H
> +#define _DT_BINDINGS_QCOM_SPMI_VADC_SMB139X_H
> +
> +#define SMB139x_1_ADC7_SMB_TEMP			(SMB139x_1_SID << 8 | 0x06)
> +#define SMB139x_1_ADC7_ICHG_SMB			(SMB139x_1_SID << 8 | 0x18)
> +#define SMB139x_1_ADC7_IIN_SMB			(SMB139x_1_SID << 8 | 0x19)
> +
> +#define SMB139x_2_ADC7_SMB_TEMP			(SMB139x_2_SID << 8 | 0x06)
> +#define SMB139x_2_ADC7_ICHG_SMB			(SMB139x_2_SID << 8 | 0x18)
> +#define SMB139x_2_ADC7_IIN_SMB			(SMB139x_2_SID << 8 | 0x19)

I think you should expand qcom,spmi-vadc.h with the 0x06, 0x18 and 0x19,
in the ADC7 defines somewhere below ADC7_REF_GND.

Regards
Luca

> +
> +#endif

