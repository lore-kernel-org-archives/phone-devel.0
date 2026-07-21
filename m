Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C137F3BCD29
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669504; cv=none; b=sBnoN9ulqXD0ZZPl7mCG7XGRC6nF5LARBQDrwSpqXtm6TBSyH+pPWwuy+/4A/Llihts/76musevv489EXq9DmkxlmWavrpeJrf6WI5Mv1sfok94M+oefItXZk/NtqSGSOM7jYQUSpEyC95BULXxSIeMsfMTqA8IZW4B9jYStNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669504; c=relaxed/simple;
	bh=ghsOcvtIMyp7Jnv2eUuE49/03XKoS3fIPWjk30ayLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IylPuPRrZLivTdGkh0YIqG4Ae0R5vb62RmP7C2LJ0ft0KLU9zdAgmFmY25g4c3BH6vFxcfUTTXGMtRb5wVUar/sibsgExOuZrVq3cW/2oAKi8dtw4fjEb9X8SCQBgkBrbOshDO3VMRAjN7JbDftnTJMIkwl4tF6MjUprVHi3uSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMw6WCLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ+Ct6Wt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMw6WCLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ+Ct6Wt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKljnt2676717
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 21:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zacs26RwRJa5c3PMx36Tgw3F
	UuGrJQfN/mmxDci20xk=; b=ZMw6WCLp2ZB1sok/8mhe9Av8ncBNfKzGrn667RG5
	7V7+MHCTk5FR27ZG9uZFV14r8dpwJyyipqKmGpryUGKzOUxl1enFrDM9kQoJNCuZ
	61B+IfuNu4j04HkBaNYaIePwt6J2HMQpEWnBNsWUhxKVOUwwR1TavEyZKo4KzUJ5
	G6xI2pVizgssh765g5XAHzsiw8bakUqjfRFpq3swPvKMNe4P25Q+NdHBls2WZVvy
	MuQvLUtGRw1Sy4fRkMkYvKnQA/AsD3qI6LeOMCs8KwURESdbVt8H8VchcdRkYBI4
	KFO04rvNVikJjFA4yoVZXdYDRiQjlL0Lmazv81CPPaNbWQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c427re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 21:31:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1de16ea7so5785579137.1
        for <phone-devel@vger.kernel.org>; Tue, 21 Jul 2026 14:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669501; x=1785274301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zacs26RwRJa5c3PMx36Tgw3FUuGrJQfN/mmxDci20xk=;
        b=DJ+Ct6WtMibPUVOe+Dn8cwi41OBbYpK/p/8n4Bv6dQkJ143kDymYc5SkJ2Lzf/i5dP
         Nw61JFnzDnrzATTlFajKnYR5b7kp4AKXkdC1wzY6+S8lifiXBkcB8wSJUXDyCLiuzY8M
         5yFs8gAO2igHPxzHpvY5WxThm6Y1a3dAQJXOSvRigfw1dk0hpoJvX6ECEEO9ND7zJBse
         2wtzjwdXvDJXaSY9w7uQD9CZrdz3zB1Sm2Pe/LfT8mlG0MiCBTSlE3r/jTB/uFUAWddv
         giBG2IMIUkggeaZFzzgKYbzDLVmLGQQNQNkw8Jx+DK21vV3Ckc7s0iVtcjdflF13r0W1
         g3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669501; x=1785274301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zacs26RwRJa5c3PMx36Tgw3FUuGrJQfN/mmxDci20xk=;
        b=lfWDVfEOt+rBAz9sh2WPRi+HUNhf5mQUumaidAdKbjjf9QMVsY80FezV16Crm82OOI
         +Fz+4mctzFpWLLqzT0a0TH7coOrS1RwSWtALJQQHS0qHpf3+MVNdoFG9+GKFw03Ep+7U
         zDLKeB8UPRvZONYMJXvgRWAvOEvZ5p00nFqQdd4VSokFGdE9iWPxzaaS3IRkkJ9f3caM
         EDVpqX4+uHUmnZyGjanbhBzIkHf0BsLrczqa0lAkKNr+lY1C1jSbJj0EiypFvqyqB0/7
         JNCBCmi7MEXpHeYwpThKMUxs3TxS8/Pww29mIO6aZAVxeT3unnBfbu+LhBhhGJ4sei/l
         BXIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVMHLII5uhtEpvrt8xVgWpbgV+BOpEAq1Lg09heoPUuJeBkVSQG66mfwcOFgCW0+HlLKPEiopI9xEIvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/5yEOgoQDl4xmN471ColWAltA0zxLhiBlfOidFLrMua4COwy
	L9Bk174GMAnNtfB1o8hE+053rriVbaWZ/3K3w3ual5ihVOo3yqnPpR/jkz/5S6QCJth5rxCobcd
	Nq1K0n72ipa4ANfO9gAVeebV6joQniQDJKieWdqGA+W6EJkSYzBCmGg4mQyT2XxbDXA==
X-Gm-Gg: AR+sD13+RPKhwu8MPWQfKrz3pf5Yj16q2yDeBNTJYaYW9J3hPeuoloWWo0khyuPsgIO
	gJZW/oje0CC3ZdEqtalZh8nTekHYg2Z9A19XD9BUou07eTHgbCijSrt+QfxqbjWbtcyxZ7J1qT/
	v7uy72CbzwMGeglyqTnhzrO1kgpSQwtJF5CAtewKkdMbZxHD3sl6fc/QQEbi0/MPb5+tFxw+fsw
	3NuigAYhd+3aH2e3AHAQPqUPaFbM4Zcr7/VhfCELJMrXS8XdIGp+ZkEYcdy+2nM5EDf2m2sIIK3
	q/kDmysfo6P+n7/Ru5ssGTUixLD182Zj2ooYxTsnYuCYtlprN6d02cqX91Yec+3Ptigkv1bGhiI
	gq6jBp6621TB4wh3A8IOZr1N4t0U1LX2uuF3WzbnwzqiOWTAgmou9/huSRmvMPWV9DX6fbR/k1k
	MA5GIpz23D6nzicQ==
X-Received: by 2002:a05:6102:5f93:b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-74ad126317cmr422412137.0.1784669500854;
        Tue, 21 Jul 2026 14:31:40 -0700 (PDT)
X-Received: by 2002:a05:6102:5f93:b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-74ad126317cmr422402137.0.1784669500370;
        Tue, 21 Jul 2026 14:31:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f93sm1179221fa.27.2026.07.21.14.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:31:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:31:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add CPU-to-DDR BWMON support
Message-ID: <x5aesfqzdvsfc5rfjefykoljn5cgrl4nzzxwyup636x2qrtfyd@kuolfkfj6cbl>
References: <20260717-milos-cpu-bwmon-v1-0-dfe0bac9898c@fairphone.com>
 <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-milos-cpu-bwmon-v1-2-dfe0bac9898c@fairphone.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fe53d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=9qgqu1SA9pjVKMr9YXcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: eK6gTMNAe-o36XuXBUbpUp2X2GLztmfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX+Rw4nYXiiiGu
 SaP1/r0r6jeMBD/T4wIpp16e9pZKnYpKdTa0HMrMCfAQ/dYEj8huzY1CCyB1ojbpolqzMCAIeJT
 eGdsXSByvdVVmh4JwFSZhJvbmUc+NZ8x/PZ/o91yHA/57cvn2buuCDjVlAXpDr24kP4zqmtZ8U8
 2Oy8/s2UPjaujQsF+BqMW+3KuRGchp8kAO6yU4t9Y26A8FtlGggZe85Ib7OpXzfig+RGJR4dZF1
 DU/tfYA0nyI38Dj5PTtrnyGgAMs/U1gSmVIYsZK9sRFVUfWlh6p7D6li6Vjg1u4i6/NFTZX0xsb
 Lyq6Dcsz3wuRSNzxgn3vhAs3HmLQQwk2z3AYq0JlYY3uMm+E0M06rbMUQ9HdyY/U+SHTgIZFqmb
 wxTwO2vTKsFfqaF3TznDhVKG/7+jpbP/6OXungEifXDS93rA6gH7qtUUFqNH8GlRF4XjygfAjV4
 bYKt1j/4inTxn3kveVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX5FPZjup1i+H2
 1ArO9fRb9Ei8BpdrQeye4a5YNgiOl76KCSM9siyJ1v9/fIBeraBW1t3RMJoMkXX9vFUjM40eBS0
 wCLIiAW/tGn35v9Qu+GMfkJJuQ27Qws=
X-Proofpoint-GUID: eK6gTMNAe-o36XuXBUbpUp2X2GLztmfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210223

On Fri, Jul 17, 2026 at 01:45:03PM +0200, Luca Weiss wrote:
> Add a node for the CPU-to-DDR BWMON on the Milos SoC and the
> corresponding OPP table.
> 
> Currently, the table is for DDR5, the values for DDR4 are put into a
> TODO comment, until the kernel can differentiate between DDR variants.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 49 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
