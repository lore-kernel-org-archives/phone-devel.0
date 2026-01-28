Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095934EF11
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612017; cv=none; b=tQKF4xuOR71gjmyb/cOVh6cTmLKKmitKISKcDXKkzV/JPEkB9Hi0TkR3UGyWiWqvMYg4sTR/X+Bo9b2EkTGOJV4hfqFTDcdhHOIBmpCm8DRYIhkrMno1vS+TEPOgk/aTI+ZWOIA90Ld0oU4/6tc7aeqC2okN9YCdaQfHDVfvlyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612017; c=relaxed/simple;
	bh=RLGH0KLlJYKtiHI1o5Hc7krURGr/94NxReup/3F61b0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DbRmQXLmx51iG63gZM+ZaLKcW4eCI8IgV68IXdZHJ9V5fCI0obVP4IaeBhKV9sVockWxrVHpGD5w+27gzgSsI0YMjLnYxMtL1Bv/tyap4kA12KokfmsWoJMgV8+27qITh6CLJ0mj/Q7+ccAnIWaQrdU6h4TCER5kqAK0A/3ZbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2VBK3Vu5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2VBK3Vu5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8838339fc6so206059866b.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769612014; x=1770216814; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=2VBK3Vu5lBA6MLYy4oFSUJkVAPutIIKdV62A7v/I1JF/Qc6Bkn5OPE1dRB58pgVjOl
         FN6hU2dQNRI1w5UQpACYrs794d/ZOXmPCJOvE+Xcdk7R2mJ1JGNAojZk4XU4uCMHkrNc
         Juj8qNug6RyhvLWpzgWi9zF92cDtiSV/mFjjjcTRb6MT/TOfDXRg00wiAeadXjwqIJrL
         uu+pFGdKTsrwsSv+GVsmHZJ1bUye8elzi/HzQyj4qrh19VGWxRcj6aarrd5mgbyZLsWd
         X4A9lR4rjaDHKE+BaPubpQVIyqs8D0CxPFIhNPG8SBstzotuW+mgLpdpGryTrG7bZSTj
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612014; x=1770216814;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=NgJu8v+K39J+1L8k3bOt9cIHXPpGmHA+99mUsdF+YUOqurcbPLWHu0CpZtvFntGx1J
         Hz+m5/1sPclR0Jd4mA3F+Kh7ZsiHmOXrGP7jh9WNoGXUUnIhGIFIxlMsAZNkzmDx+MWg
         W3jh0JPu76Y9vbcw2h3NfsmGcf8LGkrTcAMtAnUX2+R77+Ms4nVC9ij6hiaMYDjmy1OC
         4SBPFK5kVbG5BRMH6SbNZDY++I1dvkTBE1KbmU0c7U57XNqSF2ZJ1sWgZ4b4z2381tqm
         UJ2s9hlp+0Nj+/hq8ZSUT0uXMp8NiE2u4Km6+du7+/ijMB6e+Kyq5yq1NmlhhKj2bWo/
         S+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXQwJgIu0UlXE1GKAIF86vXU7YP8ZZDAHTxpkBBYGvsjQTo8LOrs7FCvJLNSpnZveFL3XLKCwcdK5QjHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiM3q8VCR/MNsM7FdYkeiH9MOh6ctaVcvW5+wbID++fCRCQohr
	rBOao0uwDpLTWKN+amabhcqOqVn3PiHk3ypdfvkvIiF0hzeOX1deMU01Ig0nX/ivSQI=
X-Gm-Gg: AZuq6aJnwabjoXyZ0xjIBW4cEQEi493EqDj0fmdFvcyNBpZJV3e8jAocBFgiwEh7Fz8
	QepLz8PKIVsmAZ4g9sLLWVbPtKmsKyoCU54wHgZUTocBRMehtpGBdOhoPnEBREY1Jahg4GNCv9i
	A2MWAtBzYLNM9O3S03a+ZrsHfAWiaJ40zpX3FLTod0LC5IewLlMa+qvPksHHT1bMpS7pO1s+EBk
	EoJ/YMwCsjTq3+RU3KStEjrJEGBGYdtTpHP5Qgwk1FRzC3LC428RJ9owPJj9so9ynn8+IDFErbe
	b9LwyfJ7llUvjvQEEwivN5StyMHNI3x9sSsKm88yrqgScmS8ZTecydhXd81cbcjsQ8Hf+m8Gj2V
	OOBalrB0Wu3mwR1Des6iHUs4teWVQ4q4qm2t+1l/D949nQZ8CLoEXuKvcuHgThrpaAGf+iFaDCN
	r4nQmTZn0rZ6AFicFupnV3V9GcX74PMMoRZJl/2US/Ll5sYo5OJI/reI8bPOiKdecxlOc=
X-Received: by 2002:a17:907:7b8d:b0:b80:456d:bd99 with SMTP id a640c23a62f3a-b8dacc41fabmr404660466b.19.1769612013870;
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc68sm137096266b.64.2026.01.28.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:53:33 +0100
Message-Id: <DG0B3RX07B9R.1BLBFSOBR0MVL@fairphone.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
 <176960748074.1497503.9897313421386306393.robh@kernel.org>
In-Reply-To: <176960748074.1497503.9897313421386306393.robh@kernel.org>

On Wed Jan 28, 2026 at 2:38 PM CET, Rob Herring (Arm) wrote:
>
> On Wed, 28 Jan 2026 13:26:49 +0100, Luca Weiss wrote:
>> Add bindings for pin controller in Low Power Audio SubSystem (LPASS).
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 ++++++++++++++=
+++++++
>>  1 file changed, 124 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
inctrl/qcom,sm6350-lpass-lpi-pinctrl.example.dtb: pinctrl@33c0000 (qcom,sm6=
350-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s1-activ=
e-pins' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass=
-lpi-pinctrl.yaml

I fixed the dtsi addition but forgot about the schema.

Will include this diff in v2:

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lp=
i-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpas=
s-lpi-pinctrl.yaml
index 2fa2484e7bc7..4903b2d37d89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
@@ -96,8 +96,8 @@ examples:
         clock-names =3D "core",
                       "audio";
=20
-        i2s1_active: i2s1-active-pins {
-            clk {
+        i2s1_active: i2s1-active-state {
+            clk-pins {
                 pins =3D "gpio6";
                 function =3D "i2s1_clk";
                 drive-strength =3D <8>;
@@ -105,7 +105,7 @@ examples:
                 output-high;
             };
=20
-            ws {
+            ws-pins {
                 pins =3D "gpio7";
                 function =3D "i2s1_ws";
                 drive-strength =3D <8>;
@@ -113,7 +113,7 @@ examples:
                 output-high;
             };
=20
-            data {
+            data-pins {
                 pins =3D "gpio8", "gpio9";
                 function =3D "i2s1_data";
                 drive-strength =3D <8>;

Regards
Luca
