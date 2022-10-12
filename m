Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA95C4332F
	for <phone-devel@archiver.kernel.org>; Wed, 12 Oct 2022 23:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiJLXZO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 12 Oct 2022 19:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJLXZN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 12 Oct 2022 19:25:13 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13B22A71B;
        Wed, 12 Oct 2022 16:25:07 -0700 (PDT)
Received: from cp.tophost.it (vm1054.cs12.seeweb.it [217.64.195.253])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 5269720706;
        Thu, 13 Oct 2022 01:25:05 +0200 (CEST)
MIME-Version: 1.0
Date:   Thu, 13 Oct 2022 01:11:23 +0200
From:   konrad.dybcio@somainline.org
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: remove bogus ufs_variant node
In-Reply-To: <20221012215613.32054-1-luca@z3ntu.xyz>
References: <20221012215613.32054-1-luca@z3ntu.xyz>
User-Agent: Roundcube Webmail/1.4.6
Message-ID: <f52bff659bba370220a76f72ec32fa0c@somainline.org>
X-Sender: konrad.dybcio@somainline.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-10-12 23:56, Luca Weiss wrote:
> This ufs_variant node seems to be a remnant from downstream devicetree.
Totally [1]


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad

[1] 
https://android.googlesource.com/kernel/msm/+/dff8939cd46ee6b95535d68c54b8bd05ddb6bc1e
> 
> As it doesn't seem to be used by anything upstream, remove it from the
> dtsi.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index c0a2baffa49d..87e9aef951ab 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1995,10 +1995,6 @@ ufshc: ufshc@624000 {
>  			lanes-per-direction = <1>;
>  			#reset-cells = <1>;
>  			status = "disabled";
> -
> -			ufs_variant {
> -				compatible = "qcom,ufs_variant";
> -			};
>  		};
> 
>  		ufsphy: phy@627000 {
