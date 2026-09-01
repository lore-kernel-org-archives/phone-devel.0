Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809A40BCD2
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274163; cv=none; b=SilVDMAedU0d5Ihd8EXVbeDJzeXDjrpj79P7cUQ3bb4HyolyErxppW2pKkUbXYZqZc4BU7ShMzjpePHSBcaosAGGPE9g7oECsQ/r0PnAf43KMLDb5puKw8HcBmT82NXTwgDY7jdW2iLYaBvYPGfYXTdW+P7UQ6E+b27ePazpmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274163; c=relaxed/simple;
	bh=h2WLcDOj3k4OBlntnyY17nVK4H30VzUclgqFOJ0yB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KewHS3c/yeY0EBgKcXA7DEJ7yDx+1E7abmpQEZ9b/29kTKWw2NDZoNFw46AQRVx1Z+0DlrVagYtIOtkBmpC56EdhVnZSuvUbsdjkqQFFk0qj7nFzLcSkqqwVWmYmgZrrdVSIuaaWiHb3lBgsibr+4XhFnLac5NM6YD3GpSX0F8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naX72m5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXsDupJY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naX72m5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXsDupJY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8ZoW2270333
	for <phone-devel@vger.kernel.org>; Tue, 1 Sep 2026 14:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvoY2QdWS/vIBjMfTsuzBB/l
	DG2V9aKuSuLYY3rq/zM=; b=naX72m5PjDY6NXu390ua8GewZqfyb8oRuKwuhyvS
	7T33ireJXp5n404TLry00uVqZkLDItc0zvqbCYIdVIogFSEMIuQINCwJMRhlyYvD
	PEnRslO7aaiV7iJYrPfIKESRl9/HzhVBlRA4EWx63DqBCLFTyEvVobRHfz+dKfuz
	ow24bO59xb9jHao/XR8fspsRN6spIdfa2cGVH6nUuQ6lrDhft90X14M5I8b+ftJb
	owt7YMH0NIrPrNaIKfhekGfan/QdvOk0JwvDXVAXbgOUQ8KKCC18u3EAEWdFYjDd
	s/KZe4WTSw0UTxxEzNAD0/F9G7wxFik9B0xZ6NaAOPOfaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3uk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 14:49:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so844374685a.2
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274161; x=1788878961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=LXsDupJYEbF3R0HW54HG1Qxz6yRb5MWk+b0RA4AJE62e9FLfgfUPp9ZABaLotVm8so
         csHAwlp59yNPODs8snpiW1z4oTBrU1N7bMxM/Ur2TQcSik4diVPuxOeTHZgv/Wga2PLZ
         OG+TkYatCFc7W1RD90/GWq2QQyhOB3bCIcM32417lSoS8dNLNLdBhvGd6U1lh8tQHS1M
         IfpPk7p7bwybFjJfhy+2DmJeK+vti4A4f6YHHx7//6gcRvrQ/vz04elD6G8vRcIG9sj3
         wCXy887bZKZ5JjoooLdLnaltExmYMWR2czNgkadpLZ2KtO310oFFAkN6pNjNXX55dG0F
         O+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274161; x=1788878961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvoY2QdWS/vIBjMfTsuzBB/lDG2V9aKuSuLYY3rq/zM=;
        b=USLUw2H/212bNwBnkzOAoEHkGHdzj2Gmnm4wnf39rbflYCUdLSsnOPRtx9TSisCODu
         Wje9CjcoZNA3kj3eCp/MatKAmqNg07+gclXT9fhVBp7KRZcJPgsC07yfEF5bwVS+riM5
         /Cdh1QHzoUYc803Rhy2BfUzvhCv3nAGPW7QmIxLzbNwiz/m/2Gsav2unGdFHvO1ppr9S
         PgAL2WoUIfUz0GP9jj48zGAVa4tcnoL3enobJXi0muPjDY6MiTKB7jFtgoIU2gHlC2i6
         fTAjGac3PIvXzxOZPJOuXyUj6CMQ7Xzgopip8RzyMRZPZhRMSywZM0Y2yINlBa/0Asg/
         GMdg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/HEfg8TrK0xevzoQRvaWkxxBljJ+9S17menAfLpW+eykKmmgJLEj2HziHVH6yuMtifhRJ4e0xvL86Ag==@vger.kernel.org
X-Gm-Message-State: AFuF++njeu3h4X6NDbTSTm+USL+pUT6koFi8r0Bnj8Suzx0ToGkqJDu4
	DGhnmYmlY1CyCiGhlncRnUUzrZxgpkT/EJ5vYP3JghWlu2PA73A8462vyYuY1HPvcUECkG8lYS/
	+it4QFOmRLPtgMkw946tGZBFaJJjS5ibk7ItQjHbVsIWExzrR5GFxSCxQY4lYYHgW2A==
X-Gm-Gg: AR+sD11rhNOZDSciMKi6vd9bYysk5uHrGxs40reoGzkPY1OvTB1ZLU25Xknrxw2EyiY
	D47Rhhd/OZ+Zhr/DldfOZQssfqQvXUaZiGUND8O805J4QvomAAdqjExie0GIIVDyKF9PWbXLVH7
	gHBwR2cNH+0HqKh9AXOqcO7jqcEPjJRmeqtag0QZ0m2nXlGO8f3X/DiXOpGKcBdm7E8af/G3x0i
	Hi+Iw3vUrQxP7wOhkO3++wBTIsVnQ4Nx4sUKlE/e4JO83IPebvdLE4Kj+RWqkCHeMMAQK7gtlsD
	9wE1JgCZGF6Czrqykjc2O0zO6a9YmfUsYmMmYKpRALvkUMRLSJsg+UonpmEKyVFWWwtekXFff7F
	6mSO3x8NogvgRmJc=
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984659085a.3.1788274160567;
        Tue, 01 Sep 2026 07:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2258:20b0:92e:59b0:df08 with SMTP id af79cd13be357-93947f8f735mr984630285a.3.1788274158525;
        Tue, 01 Sep 2026 07:49:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c42593sm5660257f8f.2.2026.09.01.07.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:17 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
Message-ID: <m4y722wgil3rw3pg55vemschlcpiug7s3zrdkn2gh5fpflp667@eahg6zydkxjd>
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96e5f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_ajnx2MfLvpOtqwsA24A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX1tddlmKRGqN3
 xiQFAo4J0IaLsCzItg+Rcd9N3PNiku7rJfjaS4TAgI3GfV/OV1FH9/f07DiZ+Q2GMPIm7PZWffk
 afDdrz+paij7abKdq8WsnjywEnaLdt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX1oghh4OCp1Jc
 fnGfXMaw8mAUVgSZMT8q0MB6D+wtSstBBmaLTEiWjCMXaGKVwOdP4Z2YlAkNK9XuHWjLHD/wBdH
 /vFo6qEn431ELh84e/PKk2D+97sxY31ELdnDMnlJ69RqNaA0XGSojlNSl7HQIumBkw7oxHQhrrB
 /0BpoeWe572dgYTTw3Ja5cBmijsr1vDpwC6M1q5w7JRTtmeZZcP+pdGY/t/YjIfaskr3Td6veNB
 xurj0iQlbuQw+/MwMa/+9WmFvwZx9nipazCxINtG0RLFO1sqyha1w/X+OK/S2++WBnHVxH9+0wQ
 E2hYqQSJKtSQCoiEz6DMIjNHlrObI+T9CrYRP8zrDIyrkv2FM+tFqTBe+v1PQqgNKhZq1c7g7Xe
 PplwQviU/SUES9IHPIuhWJj/0eAREm4086KRLqBUAczHsZmEUjypeAihm4YhC/dcmAh4EUb7Qsj
 rN5SH5NLxPnaOAqyN6g==
X-Proofpoint-GUID: CEp3WwX0XYt-0CqRysjw5GlBYD7tVZRp
X-Proofpoint-ORIG-GUID: CEp3WwX0XYt-0CqRysjw5GlBYD7tVZRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

On 26-09-01 11:20:56, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 
> PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
> that regulator is not modelled as regulator, skip the -supply
> properties for those two LDOs.
> 
> And document what the "missing" regulators are used for.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
