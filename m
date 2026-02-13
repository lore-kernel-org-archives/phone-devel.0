Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24B127F754
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771017416; cv=none; b=fzLEAk/MPLxWBy91vaoT3TtVM1EzEhh+H/eb4ZRtYHAE+z49sLNJJ5NQXcgZzEbd70a3kox71RMYYhOAVuhc8V5B845urMVqctFvj4wPy5+2eebjEVe26j5CiEsyZubD9zGI6uz9Sdn5FuTNihbXsfmMrPjYXbf0v6DnrtEFr4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771017416; c=relaxed/simple;
	bh=OmF3aC6A8T1/0ED5crWZJOtdvQTTRwXxUPlMXgkYrRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7bKjG6tLymH7HJW8F6wUmxC3mAi5O17BJr9BZ/BqaQNRhaQ3QqoWTYbolStvFPN5BkKKZFmyM1DOT7YsdW9LXmlgp7f1KbnycYipWXHCdsjBl8iwMOf9HFl9sEqHDOSegItfWhWvrlLlj2FW9y59HFu353cBprmikocfO5QTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkO+BSzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKa7P2DY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkO+BSzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BKa7P2DY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DHRhS53797875
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oMvyl59P/aj/87wJj9q6owTg
	vAn7KB99a9MNl6OFhN4=; b=mkO+BSzVn9wZNo0wNBs6WGv737b41fb+K1BYbkpn
	4xcmQD+3bVQlkDuDM1cJTim48603stEDbLXgKAzlI9zpF3b+iQwwVS3lLTck52hh
	v9sW8ApV4R2q5WXkBJDz/IBJ5up+a2lK0NJ+rXfgRDHWXVo/e0c1ceqItNIUxiJA
	uzxTldnDEHnvGnIVxhY5nE/4d/zSsHsoGpK7wCSyHEsT+YJqyL0snU9KzgCL2dkQ
	zsh1VLoHSbkqC5tNTeF2RA8bTgod2FCGtEGh+M5t7ZrF9fl+E8hwqr5yYyDtnWvi
	6gI7qq2iONmsFqtVW3hNnXqfM6QI6nE2UAxbpvbo1KbTPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8ca8qmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:16:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso680490085a.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771017413; x=1771622213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMvyl59P/aj/87wJj9q6owTgvAn7KB99a9MNl6OFhN4=;
        b=BKa7P2DY4zTrX4JIK9IWUC80Ue7j/CvODrWCO8XSliyPB8OcH9s12CRhFjFiorDtLq
         0wY61912Cu0ue2MqH0QTmk8j/sVHEvqlIY4SFmqpfwXiSwf4uo4gOwpA5akrXQcIIUfB
         JqQax03wR6XwqO9FfT3ZfQSm8ECrrfQ2KmYJN2f37bEFaPyPTk4OMrdO4sFD7TO5M3/7
         kAJyjaNhPoFM+Z84GRz+lEWgmRgDQkaGV3X27hvHqETmxS9bKtuNNJiedv+lfySWAqQs
         h13pft+aoiomnRs6rFLt+ZDMp/1RyQosMXJF0BAuJJ9ZfBE8vpfhvqZVFguqs+O0rb1e
         92dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771017413; x=1771622213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMvyl59P/aj/87wJj9q6owTgvAn7KB99a9MNl6OFhN4=;
        b=rhQ/aysYxKEvowQ93ZHaRhKoezRpfp9Q3XCa+1DhMXXClrjHuTBv9wM6a3ygB4+TMy
         wuymRHklzg3iN6B5bsasPJcC2K6lvu6q6+3Ak5Grnc2YCmBnKCVmvt1AhYwtuMY4wLsC
         Kshx5KjuSNXwcJTFhCjQ+JbkL/T9eKQEorJERffpcbCHkWcLuNLT6QMctYLmMfTEfPz/
         9SSea/CQ98nmDj4F1j4YtlraVcGs5Hq+tPl26+Jqi1wohWECQy54BYyqtg2hRqHK1EKV
         RUVuwU0uC8m2NcPFV7unB9JCumGbmM0om3uUuN2HgnZggNlF4PDiDRxmx0FJwZOvpVPH
         hQpw==
X-Forwarded-Encrypted: i=1; AJvYcCUjl8+OUqJ5sfTXTuuonaNahcItJUe2+Qhvjg7evEB3ilhbz6Ioi/FwgFVdDy0ggMbg6HKgw1/jvI6hCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjooMCYVGQJMNG6DUJ/w2vgSHTdmZb6W9U+5EEsWpTVqLLk4cM
	Y+Z9Chl6yv5r2CLZSkKpA0QB2Om2rIiPEZMVxuXt1DS7d0JCAp4nvNV/rDUR8Li4/H/3TPPvlld
	dpZL3ZM2cY8Z9XkYQqJ4Nj3vPSuLcWbMux0Xfw5X+oDN0dxNG4pyl2IyT6t/nsiR10g==
X-Gm-Gg: AZuq6aLdGcSBzhZG66jW3K8h3OyoZX6/OvYupdtyYt/Vam7Sy6gTnyMcjj3fqHXmWXb
	TkyGc83zmf08rP/Tvsul6S8MCBa5pXW47Nq98dAGqGkRssthPnGdVGrnsrV6v91va6F6NbjI24F
	B0TwZycXn8eaF7EtOUbzbeWrfE+R2ulP/Hb99RfItJ9NrxRf7twBMXv0R4VmpLX9cJzf4CmZuny
	hHlwAn41MU4tfvhGa2BwZwRXHgQHu/OpaRRovdIRaLykqv2B0NET5AGSnb7EIo7w8VcsxNExHBC
	muIWba1osNT+TFD7ogb3W0q7QqH4zQ4dyERvPlQes0am+4qwkqt3LLeochGyIwVCtxPGi9og5QK
	VrbcPzoRsyCIjZlAzR6/vk6tNk9xlsEsw0kyT09JgvyWgXdqzFgpigwoHZKzT9Wt59MbSjdGcLX
	Y4FzDMbEaaO6aFyRZIqUJr41N9JhJU2Fo+DOU=
X-Received: by 2002:a05:620a:404c:b0:8c9:f996:8207 with SMTP id af79cd13be357-8cb4bf6a390mr129126685a.7.1771017412780;
        Fri, 13 Feb 2026 13:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c9:f996:8207 with SMTP id af79cd13be357-8cb4bf6a390mr129123385a.7.1771017412221;
        Fri, 13 Feb 2026 13:16:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5635d2sm1733432e87.13.2026.02.13.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:16:51 -0800 (PST)
Date: Fri, 13 Feb 2026 23:16:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: milos-fairphone-fp6: Add Hall
 Effect sensor
Message-ID: <l2gsapxxkhpecrjmaifpv456tarkfvyyowvahkj7jcggat7bpq@rlzwqfpbij52>
References: <20260213-fp6-hall-sensor-v2-1-ecd113d4919c@fairphone.com>
 <qb3zeuhh5fjteyjy46e3dbsx7ktqvnuh3snqmcvquajdal6igm@fqwv7436yw3m>
 <DGDWUOV1HSXP.3DU4CCDF81T59@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGDWUOV1HSXP.3DU4CCDF81T59@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE2MyBTYWx0ZWRfX2SK8TRYASBGE
 ZxeAEolL4qJOmwA/ONp7XUWx2hMm9xtfjc/wl9B1xGagwS3+dM3Fw9r7SzYohtZ7bD/HL/Jhz5p
 e1PWVxL0ybmUYLyMCyyAo7e1AZCGDeVXphbU8yzJAH3iWthvWnHaJ+melDDkvpORLzV4Z9WhfVR
 pvqtTodtUF4KzzIFDE+Zs+xWLtygiHoOLv1AqxaNjnBQMeQiOYp68RISfTSrxG9SR6BwPauJc3P
 z/IFsxiJhofLsF8tN4qnt17SnJe7858fMq1Mh7MeYlthwGMPC3As+870w22DVNdjM3DvomTU0uH
 YuagucO23vnib4AY/6H03Z0fKydVqxb3G0F3Nnm+9ZgxduxoMW4d6MoiJofPU7n1hzy86Ynsy7G
 u7etSm4Tjg6tqHdZ0KgTYrLI2SBNh4RXWeMKxCaTXc9Jbbd22ge8e1L9YBKe2YPqGgR826ibkDB
 YjVMGi9kW/hpSjtPGzg==
X-Authority-Analysis: v=2.4 cv=CZEFJbrl c=1 sm=1 tr=0 ts=698f94c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=byvse3m9iWrX3UZvJDEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: HG_ShW2cwbc8GBSHN2NqW9Oc4JiRhU32
X-Proofpoint-ORIG-GUID: HG_ShW2cwbc8GBSHN2NqW9Oc4JiRhU32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130163

On Fri, Feb 13, 2026 at 03:40:44PM +0100, Luca Weiss wrote:
> On Fri Feb 13, 2026 at 3:33 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Feb 13, 2026 at 03:21:06PM +0100, Luca Weiss wrote:
> >> Add a node for the Hall Effect sensor, used to detect whether the Flip
> >> Cover is closed or not.
> >> 
> >> The sensor is powered through vreg_l10b, so let's put a
> >> regulator-always-on on that to make sure the sensor gets power.
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >> As pointed out in v1, this would preferably go via some vdd-supply to
> >> gpio-keys, but this support does not exist yet.
> >
> > This usually means that it can be implemented by the submitter, sorry...
> 
> Honestly right now my motivation to (re-)submit Milos patches is
> dropping. Every patch series I send (cci, ufs, wifi, bluetooth, hall
> effect) is opening a new hole for yak shaving and the ones that don't
> are taking forever to land, leading to me not wanting to send more due
> to merge conflicts between the patches.

It's really sad to read it (although shaved yaks might look funny). I
would not comment CCI side, I haven't looked into those patches in
details.

For the other items:

- UFS:
  * PHY patches are accepted
  * UFSHC bindings seem to be stalled, (although they are reviewed). My
    sugestion would be to resend after the rc1 and if doesn't get picked
    up, ping RobH, he picked up enough patches there.
  * DTB bits depend on UFSHC bindings

- WiFi:
  It's really an interesting question. We should probably merge it,
  because we need to support the ABI for the Kodiak anyway. I hope Jeff
  or one of his colleagues can comment.

- BT:
  I see a correct question regarding WCN6755 -> WCN6750 fallback.

- Hall effect
  Bjorn wrote a nice email about it.

> 
> For trivial things like this, shall I hide/ignore that there's a VDD for
> the hall sensor? In practice the vdd will be on 99% of the time anyways
> due to it being used for other purposes.

It's a very interesting question. On one hand you are correct for a
particular device. On the other hand, one of my colleagues is currently
trying to fight a bug which also might be caused by "let's assume it's
99% of time true". And he hit the 1% where it is not.

> I do get the desire to have proper hardware description, but requiring
> submitters to yak shave their way through various subsystems of the
> kernel is a bit much.

I know this feeling. My APQ8064 cpufreq series died because I could not
fight my way through the L2 cache devices (which is only necessary to
describe a bit of the table). Other series die because of the lack of
reviews. Or because of other in-kernel (and out-of-kernel) obstacles,
reviews, bikeshedding and similar issues.

> I've just recently yak-shaved my way through a limitation of the gdsc
> driver[0] leading to some issues I could've ignored (because CCI worked
> when the display was on), but even that thread is currently stuck on
> someone explaining some intricacies of how Qualcomm SoCs work
> internally. Even though I have access to quite some Qualcomm docs about
> this SoC, I'm fairly sure there's zero docs explaining any of that what
> was asked there because it's $secret_sauce.
> 
> [0] https://lore.kernel.org/linux-arm-msm/20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com/
> 
> Regards
> Luca
> 
> >
> >> ---
> >> Changes in v2:
> >> - Add pinctrl for gpio70
> >> - Link to v1: https://lore.kernel.org/r/20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com
> >> ---
> >>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 21 ++++++++++++++++++++-
> >>  1 file changed, 20 insertions(+), 1 deletion(-)
> >> 
> 

-- 
With best wishes
Dmitry
