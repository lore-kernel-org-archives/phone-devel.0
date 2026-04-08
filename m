Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C563537C5
	for <phone-devel@vger.kernel.org>; Wed,  8 Apr 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668513; cv=none; b=oB0CYgvTvOreBTZSHLRoN901tV10l8ifjFjDDOqahrOB0a2+NZ33Q6B+Pr1DHB35mNkYYSLe6YbD1ait7fwx9mCN/0rhGvgzMSezCrTW8Y4KtNM5+/2htChDTXSyhwMPATWyBSkTIh73Cc9krfhLxf4a31YhpYoDMHPkUGrpqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668513; c=relaxed/simple;
	bh=nh/U9xN6LkQ/KvTu465vaWXNTfMFIKFvmSb75M2Id90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jO6Glkpfz0UWf1weFD+I+jf330wbPnUGXcFQD4IDiVKIkOQSvAN4dN8lIUAf7dyHx+bSjJ0kYO2CeXw+AptkkLcyfuz1E5qzozMRvYkqeN6brWPNp1e3CVXW6yMR40ZmzeSfOA+/cC3AqwHSUGdQlPtGkwSTjMwiGPuTE5+O8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMBXpyGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzWuq3NC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMBXpyGx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzWuq3NC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638BG9AE249490
	for <phone-devel@vger.kernel.org>; Wed, 8 Apr 2026 17:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=; b=VMBXpyGxVNWwe6oy
	18Ef2/MGEVePa27+QQ3YRBkIFvhUPfQpeEMHsLNwG3C3u+D5tDBibQ7LwE3QPh7S
	zrI7iOEsCKey/VhkfFnWr/VWWW0nFZ4Gae2lTwH8f4P3k5GcneQ85znvPzzBFfEa
	lPl5hg9qEc90RpASLMzjApxmTfL41IAt5PM4rW5aKL0Z7baJ0OzbXdDrILCN7P16
	sFVbNVKosp+CZnYwQqBSWG8CFeG1m4f/hAQj6BuVoHrRrbmwBkjfc28v+/s7RJvO
	Shs60masP6S+2Fhc1HPDHrf4fuLmWNQ3N2kJ8eeOwvJ845GPM/XChT+gbQbwJh6t
	j7aiug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9c6nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 17:15:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso219759a12.1
        for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775668511; x=1776273311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=XzWuq3NCB5SeLDCoV6DRmcejRK6V15W0p2bPROFdoVHdvhGR0gny60wX971LOqLLn3
         CpgcH4SfmPhM2NliWOXZC12/L3GRBZ+WbdWpy1WmftH8/8HIbVlGDvEvXI9y37+0uCST
         TzH/+rOoYa3r9/CSmkvDTkMjiN98zcCq89cJdyws8kJNpJQ6xKuNDLqRxEK4YzP88FEW
         zzw/q2BF4/wAyjhVOnSm27hVUlkQ18ZdfvkOUKzwGEBk5v4fQaFd/JPyiIQkR8nGCCFM
         RlCH6HlxdpzJCx7KzIzNyahe+NnSAzBZXjQyrxH74SHbhZZUBH5FTeFPVVTDnJK+46ZA
         LEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668511; x=1776273311;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEX0eT0+9Pfr6i6e4HPyfeGdSAUc+2Nxl9Ny4Lo9MeY=;
        b=hb51jCpaYFKdhS8K2dVFRhmDhE3en+JdUrTGWGKmPxQ1QNRPDQ7QPc2rDc2fRbaAql
         zXSkJF71BfVa7JB3rXC1g8yiwX9KXDNNHIiGIyvib+W3McE1luYZh3pTsrketGe5fg1h
         TN89ent9nPXPbeYL8BLx5rFUALSAe9qKywxyEBC5fVh107Ir1zhg+8xH9r+EXOlATsJQ
         ECuxzg8Fk+inXlG0bVeVH//9Aewj4cL+stDMu8cqHIuBWHpnoThjMnuolq2VhLt/O8is
         kMlcuclfvZpzobCKZL/6KdGXHqmNsh6xqnL0s433pdf21Vl4wghelKtUJQBPoc6Gvk8I
         ihqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeWhsmkjtgsEtovz2kFuWfUjqzMONhKOecawo+dvACtImKLw6bEZCrmPePdd16viECzP8BzkCk8yq3CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNN7G9KJpAuKx6C5tvr+gp2pQTpflbJB9IwfjPMMwr0S9h22Yc
	0xlavBf3wgCWCl4Vy2+hji3Bkr2kXPvYsdC8BUpOC9rVOH50TGyEFSbgIxT4f3fP3gV5C17Acn6
	ormc6K24IJ437KE6QO8XY+p7//ddT1htMvPL32mo47IjHnXD9zr1KVua4vy7Wf8TqKg==
X-Gm-Gg: AeBDietBG9o/GiNheu1iwmALw6E2Aqchz9bswINGxF6on5kxGoBGdLeoKlH5gJLr+tW
	H7FxsVFVENfENz/VhxTudotAnOUrPCRoflPsyCRDRHtfzff/Zna2HyJVYgnMx+n5OESaQI2adhN
	8GHd/bSJYNs52tTVnfmhk18Vm/iroKESvZG7sWkNo8X+2ZVnNMQO6DTkGOR+mvVBKceOs9R9seB
	O9lKk4usxY7UTnhbp5onTidintZTXolZsP/hlUdeDVXWGli2lVdWd3lKyJQrBRwORuH59qEF4AW
	PWvCiTBdUdqmKOwkongwtDKc1GlIMVoEaSQNJtKlbjFjp94vBCR9KAW3sIJWMi0obFDGWSr1juw
	hVSIPRGUA1HedcznbNN2XNK/F4G6ZDDkwITYq7aTjQpCBVh/JhX+O1vjs7xDLfOpWcjnodTxnww
	ni
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128629c88.32.1775668510861;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:7022:6ab:b0:123:3488:899f with SMTP id a92af1059eb24-12c28c2d224mr128609c88.32.1775668510171;
        Wed, 08 Apr 2026 10:15:10 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm26103624c88.0.2026.04.08.10.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:15:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        David Heidelberg <david@ixit.cz>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
Subject: Re: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip
 host cap QMI requests
Message-Id: <177566850912.1322920.17816533595535960130.b4-ty@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 10:15:09 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d68d1f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XIgAiO59-CApRadi8WAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDE2MCBTYWx0ZWRfXw3EgF9S3Pgkg
 PbpLHK2Lub2gywSTvQxLFRUOvMQ0JbEriTp70xS+cmjrbUzTA/+729q6vUXxOb3+F1LES4erBIn
 vs9QA4uxcTtmvx5XfWkwQD8vCwbUPEY7QLX7zodYfTCR89a5McbaRmBKAD32WbM2U4PT4kgLwKo
 8mK8Nn6bukm8yDoqSg8l1lEdRD9+/JLrnHzpndmjC1yTDwJIJ72f7v8IexLCrg2yiA4UJSGkVEj
 /T4B3sU4bmngyvE1zgMUTuBVy8zgt1URVSloANMyGzM+ZQU1UmmlZZq6u2H0Nv0MthsXgC/XoZy
 +PV4tXLuCTx41ohe0NRierX95xP7w8cTwFwUBB/XmKooTtEzynyF3ho/Vfewm9Cm3NCwFg88thJ
 mlPIvYm6ccNfIxMGzaifgXQL7vhL63JYoGlt2tfFYkKqkA7X2ncOT8eTCeb+quK8J1A+qvzII3j
 wDg9d4g+Loxm2MkJ7Sw==
X-Proofpoint-ORIG-GUID: 8hNJkaEKulTUa7rPIgo4a8R3kXa2LNfm
X-Proofpoint-GUID: 8hNJkaEKulTUa7rPIgo4a8R3kXa2LNfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_05,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080160


On Wed, 25 Mar 2026 18:57:14 +0100, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      commit: 3d7640b6c371a1795e6d9580695d20caf16be9a4
[2/3] ath10k: Add device-tree quirk to skip host cap QMI requests
      (no commit info)
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
      (no commit info)

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

