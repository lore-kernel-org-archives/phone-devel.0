Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF12342515;
	Fri, 31 Jul 2026 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476438; cv=none; b=hTHgAW4iAfnClzAXVjOjb2YDd6coNn/iLrzA6OCbAnHy8hXJEpI98Q17F9c8CUaPHgnlJXIhoCfZuAiNyHi+2pzsb6hnqZF8x38/UppXx9nsiOdVSfGQVEHq3LXzf+SxIaZlQHKoxPJHespBtkmaR6SatgiUKUGxoAyTyAhdB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476438; c=relaxed/simple;
	bh=b2pBezfrf5LvKCHbXW4BNZXYpABxa9j+jowda/zsklc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FI35A7PprCzqbgs9kPXRnTy3iBM25fXNluy3mv29nUiRW2O7OogFO8rSiVEMcUk1M7OfQ7telW07SSlIS1sZi7WdCflx16HTwZsM0ALyygaNJfzYVPtyyhgm7NjNMTzYERJ9Z2CytC2IWg7wIoiZyJcoNW8r+V+GH9NSkib1Lr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UrrpCA0g; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UrrpCA0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785476423; x=1785735623;
	bh=b2pBezfrf5LvKCHbXW4BNZXYpABxa9j+jowda/zsklc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UrrpCA0g+LQwZRIrVyGFfpSml96AesFhZn78z4SUKsmLRh6h73PNlPZhY2AD8gZFj
	 K/aoCUOO8Kk2pq+fauRtiD4ifxZX4udVJldTBObnN7ZIkhHOXNH6J2lxHxitD01flB
	 YdRzhUIRweBh7SddF4+LtJ63CJasvRFuUmrqsUOOzvR6ZwHeuq7p+qi43LdZhMUd0E
	 oZZf3bYtf86CDgkuL0rrOo+bGB/gYpHRAGrFC/MxxEVy+Fuk/aFPM0icci8CtB7Mwt
	 NVF+eJdlzJYERQJd4Bqn3OoSBDE1TFThSpSLgHs3VbDKQE86vi6VwP2k5Xz94dz6N2
	 md7ooCH/Rr/0w==
Date: Fri, 31 Jul 2026 05:40:16 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475
Message-ID: <465f7cb8-cfdc-423b-a27e-c2f2f4ec248b@proton.me>
In-Reply-To: <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me> <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: ee38716aefcb8d543c8a02ceeb640b4b0f6cad9f
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/31/26 1:00 AM, Esteban Urrutia via B4 Relay wrote:
> Add compatible string for the PMIC GLINK service running on the coprocess=
or
> found in the SM8475 SoC.

Just realized I forgot to change the commit title... Will fix in v3.

Regards,
Esteban

