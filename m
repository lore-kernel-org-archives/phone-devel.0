Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190004;
	b=by18qDPBlK012ecIH7WvJh7HRhK314S0V/wwB52QqgsfD8+ZjLGKt3iDoEnaRKUzCr4q
	 gJgsbXmFQE7sctkfNb8pim1P+Vx8+lXFbIU89dsjGSw8rUAflIVCEEYoW6Zr5xwZ109eH
	 OJbjeK1CZjNml65s6q6VAoTJnCBIgNm/zekPK5Kd9CvTBhAYqNuIN9PPY++Ig3fZ0WkLy
	 e068LIaAY9HN4bZX/+0+zzGI2/BpW30lGM/SSPIvJyUvk4A61JYpiSrU0R0+ilLHWvwY4
	 x+izRRTzkF62Es6OltBQCwqTx2Ii38g2gUjVX/3TaXCcc0ipF3lO3i08aUP+lawFFJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190004;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HtkiigzY+SJdOuP4zRsEx795+vQzL1PbLF2tHnpb8mU=;
	b=aX256W0BKoXFS73n5PC0cPPpfr/XKGeYbUkg8oEBaYtsi5c1g4Y77boDSZXfQ2VAu1iu
	 E/MI0FkzbW6wgECl/q76pb9H7bX7+dy44q5GSTxKdiidXNv/3DQ/luAHMk9Wmtmc7AkVG
	 gdJjFHW7JxLHuxVo9ZLitKXxtKZx/1XFPe+u7uKTjCawZriEa5M6Rqoa6PbzCLHtYzHbu
	 qnbwYSN2ivCV4+UKEUdDs9cgnJNS8delvvfrOR+EmCcMQ8E3GuBI+CKX1idWuo3ecHcMV
	 99V8PgOFMAk4uetdPcwH/wgzhGXleX8Ju1JlpFfpCO6ZbSnPcRI0OfJbGQSiyLPYfOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfFxhoQq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A33606A320;
	Fri, 20 Nov 2026 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfFxhoQq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190004;
	b=TyVvFuR5hOP/0D4B2MAA10InbK4kYqgMocJ5moZ/bjhlW7VmxBkpb5gv3EqlOT1dKRbD
	 R6+D3/WTvbjJXW8sIFsX4fCWSfaN0hmdeElXWYZJgYBaehQVDyvsE+ClVhIDxHbfFonqF
	 wQJGQdx/cT8a2jCAN7rXIl/tbq0+cY8jA+046lGGirLWrNOQfLN26NteP7d1WH0AFX1v3
	 VDQ6DRgc8sR3Va3WKxlOFmP5x12Auz4xkEFUNikEDER/QHfAFR616WYEtjErln06uPYLy
	 aF8eNp7mMTFYe7CSGoXvKJV562x2olzk9KYz6+123Y/E1pddbZTycK1CWLciAJOAkYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190004;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HtkiigzY+SJdOuP4zRsEx795+vQzL1PbLF2tHnpb8mU=;
	b=WK8ueQ6lhLRsiXyh88IRVMJ/tWPX9sscD7M/nS84kHeztZ4hJsa6wdefjpa2RSLark5n
	 HRncZhe1j7LZsQ7uLo6/4XkZ86hf+mvyo3omxU/77HQFBqL9+OMfF+/UhGLCEbjEKqN3g
	 HCl5yhITYYrijC4Vfs9PtyyfD3+QwY6qyza/xOKBvav+lLqSpx3/jlnWg4Emij3B3epuZ
	 Md6V+dPTwSS2LjNWvacoyaWfPjVejfDBtmHMXSQuqUfGVrVDlfSC4MmeqtoAnqG0hAjV6
	 QfQJ2SFMP5S/3hC7UBbs0ChkVkAfSL0Bhf9WPgPdwzCvJDlanLoHO4oMWYP+X8mTTDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AAE31F000EE;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190004;
	bh=HtkiigzY+SJdOuP4zRsEx795+vQzL1PbLF2tHnpb8mU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AfFxhoQqdBPZwEGQ4N0bPvt4qIEaf9QGX9EDUxJawkSXh3j46APM7fbpyPFDa2WA/
	 8dC/04sgxyBrTO6qkIk/bn3j7q1o+Wqo6wk2CxWlw97cu4Pv7t2Zj+dFPvNFTcMo2k
	 3ahMR2rz0n7nVk4GBY/89OTkp5dee+nQ2G+CSYnBPRX2TYCv0yJ+byvbzz/Ngt7mfn
	 +Ss8SlU3IdqFAXeP/AMg8NLs7hFeFuPRfFKVQQ4h831DMm5dXHiSX7EpeJiAObpqtz
	 vZd++Pnc7t34t3EitJ715dFpYto7c+pLx6YpBIqDyo5PQYGb2P0HDlO2jdDnheg43T
	 bQIy8Xm7sY2lA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E0DAE49932;
	Fri, 20 Nov 2026 15:53:04 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:05 +0530
Subject: [PATCH v3 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-molokai-soc-v3-3-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=921;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=JA3D3612ejShp+CgP9o/2OKJA3UVuFzmTpSGVKbp7Mc=;
 b=6RO1Wrb3rIL9FsszrVLVrkyzLQ3157+CrULVSDUSCr6BaFCum8ETTZUHSnbeHtx5Tiuu79LeC
 PyOnIw65iy/BnohsdMREOtbW9GE97kKeQe7M5zjjiOFtSriF6VFdtO9
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
which maps one more range of interrupts than the Kaanapali one.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..64de63b7a031 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
+          - qcom,molokai-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc

-- 
2.56.1


