Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9797265CC8
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759300552; cv=none; b=H+yM/DrNxYLCqTccffMyWLmjvS6gd1Cuk66vsrf6Uc7vqYMyOKNbOrfVlDX/bsqgLoi31Fj/1+yQr+tqy5gjXlmQoXG3cMUuTxKpfYuQTQoblXK17Y1CKpKM/yxeMcxWVT/8BJIABvqFzxkcwLyEcs8CxHl3SGtWofGLPsNwW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759300552; c=relaxed/simple;
	bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W4mj/FXnPuciEzNy+Z0OPmCQLu6axqYn1WfdZqtQcpl6eXmDcMpWWcysAZt6somZ4NpTO2Doxf+t3Y0k8cemcaHkR3xYxhVMCt7/+uZKopTzqi9EtslczwMNIfmP+fFFrWFZohkxazBAMp64GcjrCCzPQ+kG9F1+tx9Z7hJD2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G87NJZAY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G87NJZAY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-636255b92c9so7305644a12.3
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759300549; x=1759905349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
        b=G87NJZAYW9wnvpKWV+TPXsQLH9VLL8sQnB1i+RzjWkkaxkcxa2aZOPS5SEABD28JYW
         VqgpJKkl6oaZjc33vgsv5qReXc6vCCAvwN/KMrWv6qxuOD05TtyCVmMvxdOffMDtVE5q
         QID8RlEfwZPfPTSBobJdz24AjVxuz1YMaGzbUrhcWlURs03OXI3Qy1zIOoJOM9eh3AYZ
         t51urkgfwCVG41ZsMrTMmoRJL+IqJ74YVhYgGDfs6f+T3BJYzDc5suwy8rj4FJwEdvn1
         L74rc95DOx4FYoqUK0HB+MYo48A5LeLLpotAkuxR9h+X1Way5FqsDPT9frIATvZ7hbxZ
         767g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759300549; x=1759905349;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
        b=dnrMbXq3hd0PH+B/3kCjw3dTjXHNZnyWyohx5UxU1VBbMzKoHl5Pv1/mAxywVbd0Qi
         6hlxBFmWdjghdwPfXd9es01DHE9WWN0DqWsQgdkA2QmF4FBdmC0YyOAq/MsCTeKSNOlC
         d1LKRh2cKgyLUnArfoz5dqTSE7M/PeiQaNPsTg6eCmqWJVXeW8uRCraLH2b/ZBqAPf8W
         Yr7g9y7+84AZRDOQlTQa081WfAdS5RaThR7raj8xaQt21qt9yr8ZeHPQdo+3bVwm9e9F
         7jgfDDxEKPyd8wb8Pk45+jcJhuoUajzcSKGDqvR/hj7CP93y12GJVpccXpL7O5tpnJ/y
         sasA==
X-Forwarded-Encrypted: i=1; AJvYcCWBojuQbUP6j7dVNXv3/9FzvZ9LRxcS56ahWVg51nw7HILqOCoNLBNS/pP4kaPG+sx/QQuweNjcHUoDkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4fTM5j6x/p2PnRV6daFhyFFqNPbIGaxuQvnltDrVbk6USzzx
	58YPzvTlsNMtnI4BvY6B4K7ZFb3l1iIQ9CykzkMu40ucgnwJuTH2FWyr56H/osgROrhiT+lH1ea
	dnYF6pMUTVjqhAQQmoC2i+fPc8lrF92w=
X-Gm-Gg: ASbGnctgyrwP5+wbmZAQ6/59kyVRyUE64X9V031Qv3WYatKT8Bey/nKyeMJ+F0Rvmb3
	DtXpGhEd7qHeFK8hhOYT5pjOSulQISUQy2oZISeI7bBK/BeMoD/q/nuUiXlaMn543GHHZPQuIxB
	ErmZ1zM0SPUg/I4yFCwjf/d2nQR7r+67oiWSdid9hd9f3PLY2Cqtnquj6H2t7GQFo52sy+jParG
	kh9zfrSiX5aXaR8PArgGVyyAiJI5gL8
X-Google-Smtp-Source: AGHT+IFhSXX+nUaYhO80kXEU0yzPB0CgeIXeTq5vOUpqxyC1AtlG+4GsR51QqMGGOM8phE9y25q6g3x8N6SySVVxVDs=
X-Received: by 2002:a05:6402:358d:b0:634:4e0a:9d32 with SMTP id
 4fb4d7f45d1cf-63678bce5ffmr2832698a12.7.1759300548968; Tue, 30 Sep 2025
 23:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Wed, 1 Oct 2025 08:35:37 +0200
X-Gm-Features: AS18NWCYhciIG058jyCqKMC1WKNMOiPJ72urBhVvFFESB8Xm5N9YYcnUQcQrheg
Message-ID: <CADomA4-SQF3vyTNBK8gJsGRmC0DTr550S+RVoYiaKBRoW4TNBw@mail.gmail.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
To: luca.weiss@fairphone.com
Cc: andersson@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, konradybcio@kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

Fix panel not enabled on sm8250.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

Thanks
