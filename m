Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678223B775B
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302298; cv=none; b=cyfJPCBSHeLX+W8h4k9nwiqGt5rV0DWK/kuj7DH2gpNKacQp77zLcd7JX5YKVNs+kB7Xfam0XCOZw5AD5uGd/nQRov3l03Xsjt28J+rroL9OivKCvN2+kcjzuM5mj9uZdSNJ1y5tP0No4bCYgywGlKbuoyB/0yY3Izoe/zUyYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302298; c=relaxed/simple;
	bh=491ncjziD5diK7qZMyd3XE7NLPLH14xdPjd/dh21Jek=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gMpIcRS6WTybFvlKPMSRDYxuUOkkBZc7wQGDSz8hZ1VwCdjRtfHytbzA0CdaNxS44pYRKJ2v+VxCed7Fu9T+4C6dw/F150EG43dj5Mq4OGJfBqRvKcdijn+uJRTg50LjwE/gf8Z1PyptiOy2VdivJFixzfR/yonPp83zMHJ/pwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=IphPqAi1; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="IphPqAi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773302289; x=1773561489;
	bh=OA/G2wWdlXzbBQo1bZvmaqv8EVQbrJ106sAu8h8qkkQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IphPqAi1ld/Exhs7oyK4gtIkMoVIFZ9PZeGqxDvcEUx63g2mgPoyn4Lt+0px7sTxq
	 Uum/OT1pXx1sbKYwKLuJOPoR++Q/sZ5OIANPjYWA0bWF7eQaSdhR8FS0d9tgHF9MMb
	 NZy3nUflOu8FLDpWw487gCtZvIUgswc3FreZAWzTYopk6NvBc4bRxbwqQrViCIfsAu
	 C9Mz4FzvbFbMNkmDuws4PXJk5O01IRDWrRNFnxksvcY8LgdXWR+OscvqJmskyU0Iv9
	 YdPRyonLsKh7tIADxag29efRq8GOQD0Eq/HsA8r1LOBdLwWd4tQWksyp9bEIVeSTop
	 ItsAzvFQugx1A==
Date: Thu, 12 Mar 2026 07:58:04 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <TVEaCiufQE0XjfNRlD6DUS6UjDw6nPyHh6ENYRSpFQT0ZD_o5sBH_Albc17WmU0B06PyfSq7elJ0c9C68kjDSgzBHcwYaOPl79XnKBPIU8M=@protonmail.com>
In-Reply-To: <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com> <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com> <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k> <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com> <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com> <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: fa75426f96d157ea5eec068a36d4617ab6ed608e
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Tuesday, March 10th, 2026 at 23:30, Dmitry Baryshkov <dmitry.baryshkov@o=
ss.qualcomm.com> wrote:

> On Tue, Mar 10, 2026 at 04:42:43PM +0000, cristian_ci wrote:
> > On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss=
.qualcomm.com> wrote:
> >
> > > On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > > > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4=
 Relay wrote:
> > > >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >>
> > > >> Add the description for the display panel found on this phone.
> > > >> And with this done we can also enable the GPU and set the zap shad=
er
> > > >> firmware path.
> > > >>
> > > >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >> ---
> > > >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 +++++++++=
+++++++++++++
> > > >>  1 file changed, 80 insertions(+)
> > > >>
> > > >> +
> > > >> +&mdss_dsi0 {
> > > >> +=09vdda-supply =3D <&pm8953_s3>;
> > > >> +=09vddio-supply =3D <&pm8953_l6>;
> > > >> +
> > > >> +=09pinctrl-0 =3D <&mdss_default>;
> > > >> +=09pinctrl-1 =3D <&mdss_sleep>;
> > > >> +=09pinctrl-names =3D "default", "sleep";
> > > >
> > > > It might be better to move pinctrl nodes to the panel device, becau=
se
> > > > they control the panel reset pin (rather than some kind if DSI-rela=
ted
> > > > pin).
> > >
> > > +1, perhaps let's rename that pin to panel_reset while at it
> >
> > So, something like (plus related renaming in tlmm node):
> >
> > =09panel: panel@0 {
> > =09=09compatible =3D "novatek,nt35532";
> > =09=09reg =3D <0>;
> >
> > =09=09backlight =3D <&pmi8950_wled>;
> > =09=09reset-gpios =3D <&tlmm 61 GPIO_ACTIVE_LOW>;
> > =09=09vsp-supply =3D <&lab>;
> > =09=09vsn-supply =3D <&ibb>;
> >
> > =09=09pinctrl-0 =3D <&panel_default>;
> > =09=09pinctrl-1 =3D <&panel_reset>;
> > =09=09pinctrl-names =3D "default", "reset";
>=20
> No, "reset" would not be recognized. Use "sleep" as before.

so, something like:

 =09=09pinctrl-1 =3D <&panel_sleep>;
 =09=09pinctrl-names =3D "default", "sleep";

?

Also, should I remove 'sleep' state if panel handles only one state ('defau=
lt')
instead of two states (like mdss)?

> >
> > =09=09port {
> > =09=09=09panel_in: endpoint {
> > =09=09=09=09remote-endpoint =3D <&mdss_dsi0_out>;
> > =09=09=09};
> > =09=09};
> > =09};
> >
> > this?
> >
> > > Konrad
> > >
> >
> > Regards
>=20
> --
> With best wishes
> Dmitry
> 
