Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C9C3ACA42
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505113; cv=none; b=foymY1cBmrV4oIdDNRubfRW3MB4bwP5b5I1ojz8z1KdDGIW2k6pTxcl/6MTiF/NJECPjV2eytlsBW9sTmKbYfiWB9mNIvdXD3ine+cifhZjWJSMIOE3B89GcLcaEeF6R6hxoIj5XwNscc7/Qxp1yzI8iHRrZ0PlsfiyuOn5zz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505113; c=relaxed/simple;
	bh=qNFpsTzbZWFFsE9iGPhAqreCH10Wgsp1S3A+JKsN4UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dS6Nrt2EZ3GZh3DvLKJuTtgwDcH1I7A/+cUWCEfh1CxDABdizeoM0t0afwHY9ox1zJOFjpK8Y6JA6kAD0jx0Z+0ySrrvu8pOH76KKWYt+FPCq8f1wVDcd/aJqmp1FpXl7xizWxlM+QYrc+6qUo5cUHjI/gQe88B4RjOx8XJqaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBvfFiws; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBvfFiws"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so5547095ad.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774505111; x=1775109911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=gBvfFiws1D7nrr0969LU2ttOkRDtgN0BXXAg7NjMb1jnWTiv7SwpdNrVptgI4QHkeh
         fgXQGXYgQVfLMCCRhsLdAiuvxtTmShQcFv4+owmBUkMnsEGItbmc/mkaquLahDJRLVxr
         dtoMNXsr2B0gDHbUDBbfUDN0mpW1+EbSMOwz0IPY4uxEoOT6VfbhS2r2Q2oP5QuTjy/d
         mwCqrhgFCg/bEpBlYpQqBqIQodsTnZk26HO+gvj4rpKqSanmg8wWJI0Dm9xL0I+hnkEd
         VL2NVdMiPuNiK87ljI1RcbEaJLQP9eBZf8G1Ly5ndrbLtjw0cEY8D9fwsXlwrGHEF861
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774505111; x=1775109911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=KBoU2UF8pJP+DBkMSqNQ5K47YfjXArhHLRHZtBum1Fpu6iTt/m6nGXouHZSkAekbUv
         Y5hxtaxNl3aDFhxnZzzCLMqnAVv5iqDNnlek9fia/hI7x7HgUQdfUe1KnfoBedLiQcvM
         T2mjlMCyMWTWqfQr2MD5mM0Brb6tY684kW9WKqLs5h7SHJG2zsqP0g6oZWsFsRkEwaJo
         LMQbrQPCpvu3V8uqRJdkl3T+CicCuPfQUdxb+46MHlxE7RfT4+2i0y/iWXJLZNGEMkxo
         EZDSrKJJvheQlzXjgdv9MGF2/onkhpR78qsxnkW+3R0TkY74LXN1EhhY37Kbnz0ZK+jZ
         lT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdraKBflJbHHQ1GjuaOQMWwlNMgOUm8OFNr6IeS3hokVDOzDjs9T7eIVxSFpl9WCe8oWSdDxwNa3ndDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8v9HbLDeSqHDCuDlq2oaFpfnGF1Vw+YkKbtVMlKjPf/LBFBxW
	sFZY/Y+ay/jstgej0Wb107Rc5ajUUPxBYRkegJPpapY3GuwUUSsaAZCv
X-Gm-Gg: ATEYQzzpn9NelUmPsyq2TrpH2kkrbW8D3iYQv8/ftBD/nphP/pa8yoTHNT7hZX9bAUM
	L2FsLcgmqzfBi2WMstMAl3btbvPl3M/Jhx0ZhVah7Fz/N9RTSHsF1tFZOGEPAAK8j+PNua+je41
	dUkAk8QYD+3NWzjRywRo7YC92LBh4Q63HhXY5TQ8QwZ3EYEkv4EO4tvFMOi4P95q9iullG61s+z
	klYYnh4zipYfKhPhiJDT6KbR1955dQlkz3fUegm6EIAG3hKR4Nzsy2JRbRwXDGgFi4Fkt6ym2C0
	msNltvczBifxDPTzt188otWq8GRBSyrKrbU5leNVtpYAslpvGyZU7da65sTbJ59UWH92bNYFGxJ
	5xzgrW5dm/CWafQCvzxoQZbs1qC3azNv+b/dxcPHK0uDEJEVVknz/Bd9kMqFyfj8vnklUeV8oR1
	bIL299wlogJ5S3Zc36QzM1
X-Received: by 2002:a17:903:2f4f:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0b0ac5e1cmr75649075ad.38.1774505110564;
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
Received: from ArchLinux ([43.226.30.138])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7afad1sm21051385ad.31.2026.03.25.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Thu, 26 Mar 2026 06:03:58 +0000
Message-ID: <20260326060402.16021-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Mar 2026 22:10:02 +0000 Sean Young <sean@mess.org> wrote:

> On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> > This patch series add support for various components in Xiaomi Redmi
> > Note 8.
> > 
> > Most notably:
> > - IR transmitter
> 
> For the IR stuff:
> 
> Signed-off-by: Sean Young <sean@mess.org>

Hi, thank you for the review. Could you please add the trailer to the
specific patch. Otherwise, b4 adds the trailer to all patches. Also,
do you mean Reviewed-by or Acked-by tag instead of SoB?

Thanks.
