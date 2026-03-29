Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D4C37E2FE
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798024; cv=none; b=fjlhooiLkgbNlRuN6VkxZelEBNtUubOhulIEMElldEfEtLyaYmQTj9uwJ+d7CHpnIxKQiEtiXvWd5BIa8nmspj6slxyktdklIChCyF1khrN+C2BZ5l0SCbEo9zNHaRw9Ol6wroMILs2F35rJSzyfJtBCSH2wQ6H8FMMZE0k3wDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798024; c=relaxed/simple;
	bh=yVmxEmdTEYT5C40BpyaomeXbahx2s4Uv8fOFj7HhrqE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C05m7qs0J52oZdY57A0X3qZpr5VTX80vrPs6hW7EEBvDbQFsGQiqaIOh3CqPNjYBTamMqzLECS177yJ2XC7aSB6t1umdUccL6NCY+ppiBEYUENrx73s7ZX5/tPAsLWKcfnUlHK60KLQz4sqXDi820y24D+fSuILaqsQSgtIymZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=F1MCxIHM; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="F1MCxIHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1774798014; x=1775057214;
	bh=W0csasnSx2yLDoldpvYV8aUIdRGYmyJd4mDLqJYTvJo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F1MCxIHMdX3R7QKLkPfjSwZ2x72BI1DDziiMjduULH8SsntSTYTRO1oOPFxqHYv8g
	 E3BfXwQmF0YI8RdBRaoSwwg+2U5fHN36u+fQoJFCnodYSuQJFhAqJYZHULRC2p76AL
	 BHfR0vzvee/kSTxuDMV9Lj63Ye1pzSYjctMZHCpqVQcwZATF3Pz6CqNxoN10ojkIND
	 iSvNL/JM+DBJaeCgsx3DyX+CnGVKxV5bK5n/a4K2kkGLXNHWyCsX7ZbhIBFeYOn5Qd
	 5zQhjStsi/y3Cvc4j+OwGREI1VUN/uNS1GsxPCXUJjscNf9kEbB2P/Zu3lYcV9LQax
	 7rP2sK2KylEHg==
Date: Sun, 29 Mar 2026 15:26:48 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
Message-ID: <VRCUEe2qHZa0a8HzVvhoRtAZyXO8pBU_l96B6U1kL5EFVSJyQBfYeKDvqPit-qpPRtIjUbtl7TH0JegJ7LXvctAxgyo50K6rTC5hwNjuV5k=@protonmail.com>
In-Reply-To: <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com> <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com> <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2> <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com> <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 60242aa9c11534cdafdd19119148144aa99eeed6
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sunday, March 29th, 2026 at 12:12, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:

> On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> > On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshko=
v@oss.qualcomm.com> wrote:
> >
> > > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 R=
elay wrote:
> > > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > >
> > > > Add the description for the display panel found on this phone.
> > > > And with this done we can also enable the GPU and set the zap shade=
r
> > > > firmware path.
> > > >
> > > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > ---
> > > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++=
++++++++++++
> > > >  1 file changed, 73 insertions(+)
> > > >
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > I wonder if I should, instead, edit the compatible property by adding a
> > second string (for the fallback), like this:
> >
> > compatible =3D "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> >
> > and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s
> > bindings example. Let me know what you think.
>=20
> What would it mean? I think we usually don't include the IC into the
> compat list for the panel, but feel free to prove me wrong.

I've noticed use of that in this [1] patch series but I don't know why IC=
=20
string is used there (in the example) if the specific panel string (the=20
first one) is already defined in the panel driver.

[1] https://lore.kernel.org/linux-arm-msm/20251001135914.13754-2-caojunjie6=
50@gmail.com/

Best Regards,

Cristian.

> --
> With best wishes
> Dmitry
> 
