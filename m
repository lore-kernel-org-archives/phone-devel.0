Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752B342CB2
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769553; cv=none; b=HKIlJtX9PES14QM3SKeNCJ5ScfYRxLa+sIO0w2HOqEGRPR/mixC/KJLDQDqNt/CbNeOimDBRggQqggeLmLC5ZuKnCRMOmJTJjgV9BhNLFLT4xAvQXj3FssrrInJVKyxW2n14dBItsV94/59mmGN1EFOgsxvPrGvicRN2Fb09caY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769553; c=relaxed/simple;
	bh=TK7U0/XbzM8sVQEkZGsmbGPzqT8CPmOc8EOImm890/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/qb14zAXPF5l622jVkh+oCyznF1dBbY/G9pXc3dtt2ZrHZIZgaX+acA+R1l0sqU+Z4Gn2QhFrPc58FFQEshe4xwfaGcV7GzY82XKkFn1QpjFd/cqttACb8ZZJvcsiFAoAezMpZi7WxfChWKCsJLIzkPmaHRGrnYOBOJmkqUMnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrNSwWxz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrNSwWxz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4889e045bc6so14518975e9.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769549; x=1776374349; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=mrNSwWxz0eh5CScdOed4G67cj75w7M9SNfIitwzZqmE+d5URVQHqtNEedldW0FStLF
         ySU8xqhJ4xQt+9RK4BB3V3SymBOT5uhlqngVph6PLSckw3H2BP3OPNwaQnJ6fFSgXWOJ
         TlWegM2WRrvzVzvIR841fNjZ5669ZvQo84aMYtOi5kpB0zQgmmjYNQqJsrsEp2fa9CP1
         KT1GF9aKERjzpK/xs29GJLl5D4ID4/U3HET1NGYYa+KqWQ5oJC62QJ29COs/5TNu+G0C
         KOwD5Fk9NA5np4KEgFctHbIz9/LHOJ/LPdFzkjNxVEymobKPNbu2DtA4HSyZmhj86OBB
         RP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769549; x=1776374349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U30AFcv7lgMNUZ3ymlMVV/vyQq/k6Igfk7p7bVokTZ0=;
        b=GtkRoKS3FtMeTy3S9seOnoEG/Lx+Lt4viVp0BdNKUrI+m9721ogFkeK8S2OCtBvdvj
         ZSI0NolAfvb87BndWXfSWjLhzpE5zbvUcVxFhofXIWytn4m3crmjKzx4SmMeIMdWwAUk
         altcqrIoyalugqBQR6PvUWKcDF8OcW0s35TEQJeUubyZ8Fjyl9kXMjcD+O7vEF447wje
         CfxzN15/fQZnIlyH0lpn62pheqWQH702tshzriWGAyW3ceBy4keM4d5QWlW9H+HvVlkY
         D7YCXAAxx5yUDiQKR9sza1Ts0Uk+kRuHrYmWG8FDz85UNhw85h518KnCvq+z4boQMLHT
         lZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwcUcX+0fu9ULVB/h/gfJG+wq7+c6aCM5NETEM4BMgU+6eRxgKY/ejmP+FHfNs8ftUQs58fqyqKDNJvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwfhsa2x78UCHh5Gd0i+nm3ezjKkWbtsj0oR/Y9lmhJlUM9Qf
	TcAxz5VpnxmwBo2aDPxQTdof0Z3BFxIMf6dyvUtbH63h7jK2mw4G3OXU
X-Gm-Gg: AeBDieuqpf6E4VouqufrmQ19ZEMzh74GNnsODNuVNcnb46PzlxqSdE9/ScVv5DowBni
	bbVGMeSgKtDzNvqxa3GaDX73hfE8/prUghaIu0hAgb1W0l3+b5PSc0tkPMlNqMzLfWiGyY87vo5
	xWUdVpCY4GvEzejdPEZWLz4VUOAZr9wpS3RRIjsGoX5oLLhN2CSVcWeYbOVepGwGhKf5k27KNm0
	97/5Pq/nq/qVihmvTv+i7x3xlYRdVkNolO/vTwnj4SxUZ1DKSa0WSiKJDkK3Xlbfpw7ULqFJock
	8++9Is9t+dvQYvXbeRSPxjLW8uti08o2JFhAhcCAFHd8kXLnXb0XwtuwaXoRnwOG9vy/gq/LbmM
	oFaVAZXF9I1WIMNVoZgwJr5LQNvQwCLJsS1c7IE22DvkEHrZmqsFxgOw4G0CJ8WWEu70zr+WVc8
	/skShj3UTuEIz4/YZ5zJN6JzCLzm1Iilx6Y0u26Gllcdhe/+SpJQ+GJIxAUPN4s9UpMjFp3v0vk
	QcIWW06e0wkmk39DJRCbo8=
X-Received: by 2002:a05:6000:2886:b0:43b:7ff5:fdf7 with SMTP id ffacd0b85a97d-43d642c8664mr792554f8f.29.1775769549372;
        Thu, 09 Apr 2026 14:19:09 -0700 (PDT)
Received: from [127.0.1.1] (93-140-227-38.adsl.net.t-com.hr. [93.140.227.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm1797536f8f.5.2026.04.09.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:19:08 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] samsung,coreprimevelte dt fixes
Date: Thu, 09 Apr 2026 23:17:23 +0200
Message-Id: <20260409-cprime-dt-fixes-v6-20-v1-0-8df6f88942c8@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LTQqAIBBA4avErBtQ0cKuEi1Ex5pFP2hEIN49a
 fnxeAUyJaYMU1cg0cOZz6NB9h34zR0rIYdmUEIZqaRGfyXeCcONkV/K+AyoBHpprB69MzFYaO+
 V6M9tnZdaPyhEy0BnAAAA
X-Change-ID: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Karel Balej <balejk@matfyz.cz>, 
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=TK7U0/XbzM8sVQEkZGsmbGPzqT8CPmOc8EOImm890/o=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDJviJ/WYdkUH5InLrk8SERafMJdsX2/bQz2brQPZLvD/
 Jjpolh8RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgImsrGL4p8ZyQuH3tztFn3d6
 7Ii2z/ndELVkeay3x0b5A/LSDz5GOzAyrLiuOu1Vh4fkDX+mypO6zH9v7A6fpB/jelq7rJxpl9s
 RNgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

A small assortment of DT fixes for samsung,coreprimevelte.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties

 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts   | 11 +++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                  |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251214-cprime-dt-fixes-v6-20-c15947ca5fd9

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

