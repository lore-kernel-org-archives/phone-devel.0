Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B21BC25B0E
	for <phone-devel@archiver.kernel.org>; Fri, 19 Aug 2022 02:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245354AbiHSCph (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 Aug 2022 22:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245669AbiHSCp3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 Aug 2022 22:45:29 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13408459BB
        for <phone-devel@vger.kernel.org>; Thu, 18 Aug 2022 19:45:28 -0700 (PDT)
Date:   Fri, 19 Aug 2022 02:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1660877121; x=1661136321;
        bh=cjS4FB8Xn6Fk5xAao9JqkTW7r45Ht24vCAy8MBxAcDg=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=GXFQhoiClE+wIsNtirNqWGkUIhyt2vHNQUIb1DLN/4kynuj6gdg9JLnRlDHmFkL//
         Yo6RfjO8EDz3z2X6TE5k36eV/cIRyfx+2OJNz8+Qrjkj4yT9NHe2Mg/SJMsOvv+3MB
         IebDwT28S7DKbtSPYWewq/qNvcjg0kyMOLSVR69Y=
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 0/5] Add support for Xiaomi Poco F1 EBBG variant
Message-ID: <bf2296e4-aa05-5b71-6217-e15e6a300ab3@connolly.tech>
In-Reply-To: <bb78f8fb-d6ea-5c37-0531-8d7584bc897b@somainline.org>
References: <MN2PR02MB702415D7BF12B7B7A41B2D38D9829@MN2PR02MB7024.namprd02.prod.outlook.com> <bb78f8fb-d6ea-5c37-0531-8d7584bc897b@somainline.org>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 08/07/2022 21:43, Konrad Dybcio wrote:
>
>
> On 8.07.2022 13:12, Joel Selvaraj wrote:
>> There are two variants of Xiaomi Poco F1.
>> - Tianma variant with NOVATEK NT36672A panel + touchscreen manufactured
>>    by Tianma
>> - EBBG variant with Focaltech FT8719 panel + touchscreen manufactured
>>    by EBBG
>>
>> The current sdm845-xiaomi-beryllium.dts represents tianma panel variant.
>>
>> To add support for the EBBG variant, let's split this into 3 files,
>> - sdm845-xiaomi-beryllium-common.dtsi which contains all the common node=
s
>> - sdm845-xiaomi-beryllium-tianma.dts for the tianma variant
>> - sdm845-xiaomi-beryllium-ebbg.dts for the ebbg variant
>>
>> Note:
>> -----
>> Both the panels are already upstreamed and the split is based on them.
>> There were patches earlier for both the touchscreens, but they are not
>> accepted upstream yet. Once they are accepted, we will add them to
>> respective variants.
> Hi,
>
> I believe this is not the correct approach. This may work short-term, but
> you will have to prepare 2 separate images for the device and mistaking t=
hem
> may cause irreversible hw damage at worst, or lots of user complaining at=
 best.
> Instead, I think it's about time we should look into implementing dynamic=
 panel
> detection.
>
> Qualcomm devices do this by parsing the command line [1], as LK/XBL
> gives you a nice-ish string to work with that you can simply match
> against a label. Other vendors may use custom mechanisms, such as
> a resistor / GPIO to determine which panel (or generally hw config),
> but implementing this mechanism would make upstreaming of lots of other
> devices easier..

Regarding dynamic panel detection. A mechanism for choosing DT nodes based =
on some
generic (read: extensible) matching feature would be pretty neat....

e.g. matching cmdline:

panel {
=09compatible =3D "some,w3ird-panel";
=09/* Only attempt to probe a driver for this node if cmdline contains
=09 * this string. How this is described and the type(s) of matching to
=09 * use could be defined.
=09 */
=09match-if-cmdline =3D "msm_drm.dsi_display0=3Dsome_w3ird-panel";
};

or perhaps GPIO state:

panel {
=09compatible =3D "some,w3ird-panel";
=09/* Only attempt to probe a driver for this node if GPIO 43 on tlmm is hi=
gh,
=09 * and GPIO 44 is low.
=09 */
=09match-if-gpios =3D <&tlmm 43 GPIO_ACTIVE_HIGH>, <&tlmm 44 GPIO_ACTIVE_LO=
W>;
};

This certainly introduces the temptation to do awful things...

>
> This issue concerns many phones (and well, devices in general), as
> they are seldom made with only one configuration due to supply chain
> strategies.

It would be really nice to solve this in-kernel, chainloading a bootloader =
sometimes kinda sucks.
>
>
> Konrad
>
> [1] https://github.com/LineageOS/android_kernel_xiaomi_sdm845/blob/lineag=
e-19.1/drivers/gpu/drm/msm/dsi-staging/dsi_display.c

--
Kind Regards,
Caleb

