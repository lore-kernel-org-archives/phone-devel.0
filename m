Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0642882C5
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798509; cv=none; b=BO768DXnfSpuiUBVdYu1z+q+RsOatCPHANbkD4xBFbi4XM8D07PCiM3DgaaZC6W7fxUzQCjVLHLroqgMwJuz0TaCLfW01IhOa2rPY/gJxwxCzRs2cpas3at++fdr76urha02TDj4Xx6Xc8Wa+Vdu6Cl2JxePRoBg5cmQIv1jeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798509; c=relaxed/simple;
	bh=ztO90OA7SFIyJUVjK8nlNGn9JJ5eZOFp24N24RDbL0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZ/kPUXPFClxgLdIggO1cmNiF6VkAPnANHS7J4t66WVKyMjciW8CRnXkV7UGTlreUCJY+2NC3z/JMxwppITibP7r8xfW02iGXCSEQexZa6JUZgeOXwTbvwb/7GsewQyYFdkxwiJM2YIBcxMAZ/6NDE6W958d4TxQrr3960MQt84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxgy57rI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxgy57rI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e46fac8421so2506177f8f.2
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798506; x=1758403306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyY3y/zfUMXFXUpRJ3OYxoXXX3m+tz9/9uTca/6/ofU=;
        b=Cxgy57rImp5bFwJj2/yRy9AvVSk3tbtaiHhfNmtWLVrLSiLh+ph5ydyddu6yHxAL7f
         0mIDUo0GHzDiCud31Wu7Zcy58Mr3gFPrqmqRjMSCz+S1iTqXKflV7aMYhNa/UBLHu1me
         U21eNq+rlTdVGsIG0tv5gJQuRIcU5Z7d4TSVNQhrHglBkscWmv1a9vNtRG9fr7TaJfjh
         Ve2SVt5KbFmE/ejJebBl6oYrRpFL6sLU5g1dZxgpu9+F6TdAfSGZMRqXdVqRytrhrZ46
         h7hDvH0GoZIlDfmnhi1DzXRLFeVj7eIBG1H6vTxv6sxLb8qpBejVfktsRtqanip7+2Ke
         KKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798506; x=1758403306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyY3y/zfUMXFXUpRJ3OYxoXXX3m+tz9/9uTca/6/ofU=;
        b=gjgUnU9VPdgGLHPlcUZhQjjtPviYp7D3Z+RmmI1esP/FELjrPfma4pyoyq83hzdPxS
         rf2KLrpTgQrt6HfwA4w2gjY7+PGOJlgxD2oPnm/D1wT/9tGFtp5U6fY3foGoMhUIDfUo
         cCPmUkPKTXptDbW8kSKzXSXj6Ml5yGbd9YPeCzW2/8CqujBLNBTn9XWH6vfzddKiaGBB
         jven1YkaNe48mxN2EOQKCKEh91qBUZnemNQgPXZDYbW/8UQaqEYxYgqgINTSrpijJ4na
         rJrmalQAfL/PzFNixY4gLoq1AWS/67CbRPlXuC1rNJ1Pd3QZ7okg22zvrIRiSFPF5JQs
         0Tfw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4O5gZgUBS2g6qri7yHk0wb0QoA4Ab6eUZS7+k0w3ZwwQvlTom5Yzxzu2TpG0qXY4ZaZnI9KWZff0hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxB6auvUDWCb9HELqiJxeYlg7RKsd6JBTnmSqsvg0MGeOTYyNMO
	HV6LUtxuIttJ9l8tAsfhb/cqtzeciyK4Ghkvwk1EPQOJ+/343Qa+9bvS
X-Gm-Gg: ASbGncs9gO6vb1RD1anq5zBGVHLr/hxZn8f9DD1xEWmyCC2PFuFjRSU3piO315LPiQx
	msaiBw1ZZkVIBEIenYerYYpqZWCLk8PhSpd3hi7MDzUuh8c8Ce6wqSpA8nh3+qwEk9m0koOkoan
	hq8kRkrnZ1Dq8N/GVA4B/Vwn1dJtyfVDwc8a5KC2ctBf4N4i5tdPpv8QZYnL5LyWri8nur38fLE
	lPv1e1nGyTe3hhY/wg8tsejLDrQUnudhudKMuSJqnP2zzDKGxQk2ZxLyd5wC0DA9If+MBkGEpYd
	9olyI94WWbOniWGriSdcQREpil2vlG/FIgUHuabcqtuxQvUJJc5d+og629L0japNK5mi4Nnyjtj
	w1mpgfLhBlixpHgBinrP0PqrJSv4Oklc+i4Kzt2IkoBhFXZnjSoJq
X-Google-Smtp-Source: AGHT+IHeRMdY0v41y9UG/rCilo0nlRpcPpVfU8FDp0C5dtOoNsF92GLDoRzILM7KZ+pH0kQfdzQpNQ==
X-Received: by 2002:a05:6000:26cc:b0:3ce:f9b7:4db with SMTP id ffacd0b85a97d-3e765792bb7mr6581555f8f.24.1757798505977;
        Sat, 13 Sep 2025 14:21:45 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:44 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:11 +0200
Subject: [PATCH RESEND 9/9] arm64: dts: marvell: samsung,coreprimevelte:
 Add USB connector
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-9-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=UoJNCWjZnaplQXJr+hNjiSMuZ5Y1BK5iXqLcT0rH1m0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/i7ZUddnNcm6NX88ZzeqdVLopceTHzeyvbQ4GbZ5
 PvaH7PaOkpZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAiM30ZGT5cnORQud/ucF2i
 9XoPuY3MVi/3HmcWv8LkI6p32urQvgBGhgtbDuqdMI6cvOB80Kwj50vyGvdPfxFbJPvwiQpTp6v
 1H24A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Add a node for the micro-USB connector found on the board.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b3741389e2ae056714ff4235b972bc72b5560455..7c96eaa33b1ef0176811f3b4d915ce1a69cc690b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -68,6 +68,12 @@ muic: extcon@14 {
 			reg = <0x14>;
 			interrupt-parent = <&gpio>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+
+			usb_con: connector {
+				compatible = "usb-b-connector";
+				label = "micro-USB";
+				type = "micro";
+			};
 		};
 	};
 

-- 
2.51.0

