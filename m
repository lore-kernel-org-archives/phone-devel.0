Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C7AC4332F
	for <phone-devel@archiver.kernel.org>; Thu,  3 Nov 2022 23:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiKCXxk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 3 Nov 2022 19:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiKCXxk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 3 Nov 2022 19:53:40 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972921CB30;
        Thu,  3 Nov 2022 16:53:39 -0700 (PDT)
Received: from [192.168.31.208] (unknown [194.29.137.22])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 024551F4F6;
        Fri,  4 Nov 2022 00:53:36 +0100 (CET)
Message-ID: <dba15541-e85f-6e45-cf44-e44f33788d51@somainline.org>
Date:   Fri, 4 Nov 2022 00:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 3/4] dt-bindings: firmware: scm: add sdm670 compatible
To:     Richard Acayan <mailingradian@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221103230349.212861-1-mailingradian@gmail.com>
 <20221103230349.212861-4-mailingradian@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221103230349.212861-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On 04/11/2022 00:03, Richard Acayan wrote:
> The Snapdragon 670 uses SCM as for PSCI power management. Document the
> appropriate compatible string for it.

SCM and SMC (and SMCCC) are closely related but not the same.


SMC (secure monitor call) is the standard mechanism of invoking 
communication

with TZ.


SCM (secure channel manager) is a QC mechanism of communicating with their

vast vast vast HYP and TZ implementations, using HVC (hypervisor call) 
and SMC

respectively.


SMCCC (secure monitor call calling convention) is a standard for how to 
structure

SMCs and HVCs.


PSCI uses SMC calls on sdm670.


Konrad

>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---
>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index be1b5746eddb..25688571ee7c 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -41,6 +41,7 @@ properties:
>             - qcom,scm-sc7180
>             - qcom,scm-sc7280
>             - qcom,scm-sc8280xp
> +          - qcom,scm-sdm670
>             - qcom,scm-sdm845
>             - qcom,scm-sdx55
>             - qcom,scm-sdx65
