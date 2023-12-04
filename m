Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="4L3ziRE/"
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DDBFA;
	Mon,  4 Dec 2023 10:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701715309; bh=2PAcdZ04uUxyJLm0VRzSG1hwJegBDoQrkRkj6wKigh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4L3ziRE//d5LvCE1u1Dd/tyddQCYhOPpiYiJH44uwjkb7Oa02A1Zi9etQELda40dy
	 ih9mPfffEDnnlKCNXDIbo+bu0BWYcUECn4aSKDxbj7Y8SqRsKIP4b9vHz5aMh/mQdt
	 ro1O88u1hgjv3SiJvW/wAuULODgqw2KCzEUaQxeE=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>
Subject:
 Re: [PATCH] ARM: dts: qcom: apq8026-samsung-matissewifi: Configure touch keys
Date: Mon, 04 Dec 2023 19:41:48 +0100
Message-ID: <4877522.31r3eYUQgx@z3ntu.xyz>
In-Reply-To: <20231204094649.10094-1-matti.lehtimaki@gmail.com>
References: <20231204094649.10094-1-matti.lehtimaki@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Montag, 4. Dezember 2023 10:46:49 CET Matti Lehtim=E4ki wrote:
> Add touch keys which are handled in touchscreen driver.
> Use KEY_APPSELECT for the left button because other devices use that
> even though downstream kernel uses KEY_RECENT.
>=20
> Signed-off-by: Matti Lehtim=E4ki <matti.lehtimaki@gmail.com>
> ---
>  .../boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts    | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts index
> f516e0426bb9..8a2ba2aadf23 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -268,6 +268,13 @@ touchscreen@4a {
>  		interrupt-parent =3D <&tlmm>;
>  		interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
>=20
> +		linux,keycodes =3D <KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_RESERVED
> +				  KEY_APPSELECT
> +				  KEY_BACK>;

Might be prettier like this since it's 6 items you're adding, not one long=
=20
property?

	linux,keycodes =3D <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_RESERVED>,
			  <KEY_APPSELECT>,
			  <KEY_BACK>;

Resulting dtb should be the same, so it's just a stylistic thing.

In any case:

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

> +
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&tsp_int_rst_default_state>;




