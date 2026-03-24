Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2A382F1D
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321657; cv=none; b=N/E3agF8HvG9hVkvixVSGkGf0St5+t4Ufuh6u3my8UfQq6J19NON1infBcB1ZXrJ5Dn0GLq/uNdVuO0G6jXdQjsurVtwT5/E+P3Dcy9Fn05l70iGn31qUdqeW+5LPLfkz3VpdklNQ2VcNUzugboe2q0oe88tU3khh0KlUYEecM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321657; c=relaxed/simple;
	bh=2B6st1g3WZ0PQOAUsZSJPA3CSrZ82gOB6l8xjOM5kps=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=eIWQ7Keq4MxGzFL0ngIwpuchbZclkSL1ddK6DygH+UddXaT64tJgPXjS/gu5sMD7HijSDr/UTxojjV/6x4DnNspJOsu0LhI5bfw9oz6WVmuH7rDUcGIjDX+RFg0fysBMW10BE0sxyYEDTsVVtqrNYL0dEkwWj8H/eLZCvSpH6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=iTLUsJrK; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="iTLUsJrK"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774321652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qo2sYl7b6ofxlHD2SMhXRvhSH0pp3d3VlXFV9BnwRBg=;
	b=iTLUsJrKU+sUBKgtOp7A1Lk6o5sA/Yywrxa0QP8ELlXujMWEzBRETcuxN27zvlUrBU9iPL
	ZDOg18FoyqOj/PMS01Iv6EmYI3vVYlMvV1H+6sBC3lHfiaQSKBEEr09aqG/GgaW2XpVg8r
	Upb7HQRwNsSjyTbbjZzIC7lVIvxqT/o7wFzrb9ea3xTeqwDATFCxOuzVu54pL5SnKnTg2g
	SxFn8nX3BqQxIU9J0ec/gtEjkOISV9Pfl4mx1m4TLRBayKe3RhVoCjaYzLSFEx6wFkEzxy
	NMZGCC76cSrR3LcK8XBfjRRcUd7yCAQUxIM/0uWhWy5WN198BIoKqQ2D4176RQ==
Date: Tue, 24 Mar 2026 03:07:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <895a96b28d1a228557832ed2eb696d6781b4ec36@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Amir
 Dahan" <system64fumo@tuta.io>, "Christopher Brown"
 <crispybrown@gmail.com>, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bynxwz5venb6jkybamylu5dl5pmjavknoa56dkzyhgrskpgcxl@oyxqp3telscp>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-7-80c1ffca8487@postmarketos.org>
 <bynxwz5venb6jkybamylu5dl5pmjavknoa56dkzyhgrskpgcxl@oyxqp3telscp>
X-Migadu-Flow: FLOW_OUT

> Please submit the bdf file to ath10k: https://wireless.docs.kernel.org/=
en/latest/en/users/drivers/ath10k/boardfiles.html
>=20
>=20Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>=20
>=20>=20
>=20> +};
> >=20=20
>=20>  --=20
>=20>  2.52.0
> >=20
>=20--=20
>=20With best wishes
> Dmitry
>

Sent (a while ago) https://lore.kernel.org/ath10k/c4ae548c-468d-4451-87dd=
-460b4e72945d@postmarketos.org/
