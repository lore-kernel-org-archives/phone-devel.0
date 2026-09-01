Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E847A882
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257947; cv=none; b=lask3ecoV0tkA9+xRk/cfQeBX1dKd81kQRznPyFo5U9fIInQpBgfslTpj3RC32FWAk4R9T3JOiPAP0Iqkp0rgDJPqLDdF8bWkd0zkU5RcoV/hS2RhboZBvbgyAJ4RKKDnwvxExmP+V2p+3tE655q60bqfZkCcDiNrrz1c/2y8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257947; c=relaxed/simple;
	bh=EIrNvUHDstHHjeFO3U3xOZlTlAPgkrzoxREHv2U3uN0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OeiZOpqb5tflTk1kVwaF0RPG9F32gImUbZbsZNRujcr+HDb75hs49m3/vUAcEmHohwH6PqJVk7EsFyMSCkbHTaUAvsLEvAk7y2+RXlzykcJOY9iD4M1vznVoxBNuZPzYQvYx7ROVGgvENCQln9S9kLec8VoZKOSFzrbwVPfBRa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=frvFdlTO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="frvFdlTO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2569aa5116so138821666b.0
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788257943; x=1788862743; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/R2B4UIn9uyXdoZMfmtsPZpaGxOVNwVD5ZuxHGzJeSs=;
        b=frvFdlTOqgkCeW2YCZUfPilvQBCXd3N7umri5bdQa722FT9DT5tia80QY2a26O2crW
         Hdn4WstmCXvtJXAKql6MNWiUf+eRBL1c6tC0PrvTGHa3LgrM/dneD22FvH4G6VCQdTep
         ZgJTksz5hkMwn9KqttobQtKCsS7lVGvpduqid1wIiWTeqcvIpKEdEXtyDEo+xjfD68/Q
         bQAofkA+GQPvSE6Eb7Jhi+GB+NNEe7BUPXOCrR4ByvoHeNeVi775Z+jX9N13SxTjwoIo
         GTby0LiVgwKkIHvBgvrEHeSP34V/krX/plCXpkjgSjTlykVRtOmybrXoALO8y0NLIikr
         Ecbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257943; x=1788862743;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/R2B4UIn9uyXdoZMfmtsPZpaGxOVNwVD5ZuxHGzJeSs=;
        b=oETCn/+xXh4HMNdKXM8pmh2WIsnTtrMBbZ+UTnBS3PCBVaNlXBBrI7pOCpyiP2Ue3r
         /yzHs4nhiIOLyfym6qals4vI9+kxIN5uU5FkaouDLKEl0cJNTe4/1mrSZejIsSXAf37Q
         LAEY2Tg/Dq5S/kc+04dioLJ7aEbU7oduhevkOIQSNEzerKmNMoExR9iYMHt8ARzmQjOo
         HTvsdI6XAWwZn4leK/cM8cPo67aNpziQbxtDqIFpSMebD07wJiAn2wuweML4bM9w7Pqb
         FZQT/zcliHgWklnP0HQg/fp5t2+LTQcLAVqeA6B2NqAr8eQIzi186afOZqSOm6xAN4hc
         D1Hw==
X-Forwarded-Encrypted: i=1; AHgh+Ro94EZ8K4GysRjzPh7GwbMUTvm2A0C5O1/wy49tZUDe2anDOMs70nfQlBT9WYmrV6/S6f4ITzkKDTQnKw==@vger.kernel.org
X-Gm-Message-State: AFuF++mb46wliqV6fe5enyIege4Zmu98T8Pr9w+M00UQGBNh3aC8/HCP
	UneSwNb1p5H7wXZH4HKlBJqHgzhDHRKTIR5549hbjL56tsrSHL0800h6Z5cFmq19ujc=
X-Gm-Gg: AR+sD129QJFTRNhwjpLnjE1o1dwrIKaan2IFV/wdoZOGpWXJVrkdGAk79QIAIE2ZOLo
	F25yJKzvMiSGw5xOajWafl4MiTJ1Ezg5q0/1rgSnim81Do4VTqInUJ4PDxKIc7ysG94r2oDp7+P
	8U2j22ucP2HuQKrjURVLjvYq6r8AlVb242hXWhr6YDylELmhVYHdYOrBp7zYNXhPJ617dYKuycz
	X0n4ipXjDZwtQSsyPo2wK0na0b5E86OJ+PKiPAXBbStp7cnWQaiYPFEDapu1u+0awLfJALVhgef
	kK7Qq+i1Jwku3oNDMyuWuV9Abv61PjaGzY4Xl8YXkXP0RZkfEe0Q2YrHW5Qo42Mo7gWWOA5s/zu
	rfYwxAypAYruoC8aqg1NPcX7+jlgdjoBzLWSGxML1vwOKmFP413VyM0Vz4bz5OkBQ/9CZAja4tt
	+eH5fjizylgv7K9dV/eLYEhFu5rq+o6VLuCjotPK0gWrQBbIca2WZcFHt8F2N100H9TyMW6OkiJ
	9t/R0c59A5foti83GJ/es25wX2UocIK9w==
X-Received: by 2002:a17:907:3cc4:b0:c16:6dac:a008 with SMTP id a640c23a62f3a-c25b919fe0emr274723666b.8.1788257942589;
        Tue, 01 Sep 2026 03:19:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b388sm549393466b.5.2026.09.01.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 12:19:01 +0200
Message-Id: <DL3WJ9AX6P5Y.QS2RPHUIJWVL@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Enable Bluetooth and WiFi on Fairphone
 (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <178820768635.1699313.4119708799289566517.b4-ty@kernel.org>
In-Reply-To: <178820768635.1699313.4119708799289566517.b4-ty@kernel.org>

Hi Bjorn,

On Mon Aug 31, 2026 at 10:21 PM CEST, Bjorn Andersson wrote:
>
> On Fri, 03 Apr 2026 15:52:46 +0200, Luca Weiss wrote:
>> Add the required bits to enable Bluetooth and WiFi on the Milos
>> SoC-based Fairphone (Gen. 6) smartphone.
>>=20
>>=20
>
> Applied, thanks!
>
> [3/7] dt-bindings: net: wireless: ath11k: Document WCN6755 WiFi
>       commit: e506d34e57236c41cebacc43e50f35f5b52dc675

Mostly checking in, are you planning to pick up the rest of the patches
from this series as well? PATCH 1/7 (PMU dt-bindings) have been picked
up already, and the bluetooth dt-bindings patch has an Acked-by since
June sou you can also pick that up as far as I understand it. Then only
dts is remaining which still appears to apply fine on latest -next.

Shall I resend, or can you pick them up from this v2?

Regards
Luca

>
> Best regards,

