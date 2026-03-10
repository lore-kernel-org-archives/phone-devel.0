Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC283033E0
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 16:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159654; cv=none; b=sMBNBCDes9VoZy7EI3sG05SBodP7b8ykqjW6su9HVgJ1VW/pq0ZtJoqtfKvRjBy4f0UswNina8WC6BnfEt9vDLFRHduknnlYbbMzUixoL/anOaxpU+Bjz7cx73iGzMVc1kwOjgIlzTDGVePBACNGNrxP78xgUsXC+tkT6zMJKIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159654; c=relaxed/simple;
	bh=/kwTVlD5wO3RCWS4OFNL5bpmNc30DwJBQHbTccteqzk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpRcNE//RW11g2t9p1w6ynX95Lqo6alsh4NClSbrldVJ9ijVYF6FXpV+LbpaotI38ooyTC9397PfkO1ExESgA4jopXNTNYP4vXpZAo93J0npzeVWUTU82DdEr1MYiz8BCKDccofW039x8EozsKqaTCOF1bX+nL3AfaJKSg+9oPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=USAjZal/; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="USAjZal/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773159644; x=1773418844;
	bh=e4HSNccmKB3Yosyw7jREa+wZR4UoY+r/POtySV43otA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=USAjZal/c8ilL9UQOS7CG0sYrHwTi9FBeut5a/NsYoZG0lwdGGYaS4NDxc8simfKI
	 G1DQayq9yQLE51Y9D5hVV6Hs+Y8QZTfDg0tGpJJYkTOf4OJ/u/Y3gPK63PeFd+2FQH
	 tJdGLkyguEfaABALivsD4vE4nYRDGFa8ug1jBmCEP0jLPo/2a/APRcqNH7LibVFE8K
	 j6pH77iN9foF86SfmQISUxLOxwyRxjV1P/Idx5+FxEnd3dCHF0FF8Ap+AvpjftXAi+
	 YDze5RPLK9BOBWvBInLZkd1WfuH7vSbLxu7Rs0jAHkTTqasU+4orNaTLLIxyvynoOA
	 IURn+Uim/Ohcw==
Date: Tue, 10 Mar 2026 16:20:38 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
Message-ID: <zqVKBYSFu9Qsyz7CKpxCBliYAzh1QjVqyTi24YLuiZy_muAh81pAHgkTWsEaAJsRbMlG_UewopTzYleJCypPrbukpTaBZSpuBtmG5QIKMPs=@protonmail.com>
In-Reply-To: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com> <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 774cb5722f82a2c4e94f4ddb240ac2f7a274f305
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable





Cristian

Sent with Proton Mail secure email.

On Tuesday, March 10th, 2026 at 14:08, Konrad Dybcio <konrad.dybcio@oss.qua=
lcomm.com> wrote:

> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >
> > This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> > Add it to the device tree.
> >
> > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > ---
> >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++=
++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch=
/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > index 7b2849405462..709ea6fc9fbb 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> > @@ -94,6 +94,31 @@ &hsusb_phy {
> >  =09status =3D "okay";
> >  };
> >
> > +&i2c_3 {
> > +=09status =3D "okay";
> > +
> > +=09touchscreen@5d {
> > +=09=09compatible =3D "goodix,gt5688";
> > +=09=09reg =3D <0x5d>;
> > +
> > +=09=09interrupts-extended =3D <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
>=20
> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> even consume the former. Trying to read through some of that, I think
> it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
> (which nota bene doesn't match between the comment in that driver and thi=
s
> submission - perhaps that's just a SKU difference) during the reset
> sequence
>=20
> i.e., does the touch work any different if you drop the above?

Apparently, not. That works as expected.

> does /proc/interrupts differ?

When interrupts-extended is defined:

...
 50:        318          0          0          0          0          0     =
     0          0  msmgpio  65 Edge      gt5688
...
 54:       3141          0          0          0          0          0     =
     0          0 GIC-0  65 Level     gpu-irq
...

Instead, when interrupts-extended is removed/commented out, I see just:

...
 53:       2404          0          0          0          0          0     =
     0          0 GIC-0  65 Level     gpu-irq
...

> Konrad
>=20

Regards
