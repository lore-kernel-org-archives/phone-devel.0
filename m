Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1A279329
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404244; cv=none; b=k3ciJ1p5JHat7Pxiiq/2gvB7NCgvQbkNBhovUVamgeynUBw7N7IcG5SUiShGo4pOq2eEwWWDNY4usGekGuNBGCCo/i/PxeSdCXQUQFDafnefvENVK9pCI+QsdDItqME0wota/Pi2tztgqaNQhY4+736KuJhMauNSCyiftJ72F5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404244; c=relaxed/simple;
	bh=xoJ9gVGG+IeFQcCWPQHWopty6y4pcOv+rNj+cO/LrTY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=eqSRVk7wgQnOj92XCLACSZ8GBe9OU+oUeMgKA22hKJATJtWZm9Jv1LcnccxfcYpZHjYTHqymDLyu6GbETGglxFP/UOB/QHhZ1Zxgkkzb4HzequJYa4vnkNhNE1w09oJXKKT4sioQS2A6G451M6FfoTzKLkjm7OrNv/a1HD1zNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=l/p0APYJ; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="l/p0APYJ"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774404230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UCIg2TuAJ0x7hXMl7aBTuI5S/PwVnWJXD/57AkKX68=;
	b=l/p0APYJyC4dto/H8ogGc6jcOmS08l/7KW8r7+NsdrSXIOoZDYmVkOWjUyKhyAcK3nd3bD
	eFBUzXmasKsDdUKx6BBX/CkabrxDfcNrYs8LJekHvJ6KM3N7J8zmoJXbZ7ZSKvS4Ny/qKq
	xX+xmWVr+KoBGJJMX89jZjc4dp4Py/ZNCEWaYF/RiWicZD8WZW58o/eKiogTT6GqosSBms
	a7/ojwn+hXv87I6rD94jwwbG33RTZMj0xPcdhJa7XADmQof2H8JkHbjbuMTe8yG1+LWxQa
	jzLJrQgyC6JHfVv2KfzskgZ861KFnXiAEtnGU9ygTCTg+q9o3npGCJSpXfb53g==
Date: Wed, 25 Mar 2026 02:03:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "David Heidelberg" <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Amir
 Dahan" <system64fumo@tuta.io>, "Christopher Brown"
 <crispybrown@gmail.com>
In-Reply-To: <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
X-Migadu-Flow: FLOW_OUT

March 24, 2026 at 8:56 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualc=
omm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=3D%22Dmitry%20Baryshk=
ov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:


> >  &ipa {
> >  qcom,gsi-loader =3D "modem";
> >  + memory-region =3D <&ipa_fw_mem>;
> >  +
> >  status =3D "okay";
> >  };
> >=20
>=20This looks like a separate fix.

Should I put it in the gsi-loader commit, or keep it completely separate?
